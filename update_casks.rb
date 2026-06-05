require 'json'
require 'open-uri'
require 'fileutils'
require 'net/http'
require 'uri'
require 'openssl'
require 'digest'

# Fetch releases from GitHub API
def fetch_releases
  url = 'https://api.github.com/repos/godotengine/godot-builds/releases'
  uri = URI(url)

  headers = {
    'Authorization' => "token #{ENV['GITHUB_TOKEN']}",
    'User-Agent' => 'Godot-Dev-Cask-Updater'
  }

  retries = 3
  begin
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.get(uri.request_uri, headers)
    end

    if response.code == '200'
      JSON.parse(response.body)
    else
      raise "GitHub API request failed with status code: #{response.code}"
    end
  rescue StandardError => e
    retries -= 1
    if retries > 0
      puts "Error: #{e.message}. Retrying in 5 seconds..."
      sleep 5
      retry
    else
      puts "Failed to fetch releases after 3 attempts. Error: #{e.message}"
      []
    end
  end
end

# Matches any Godot prerelease tag: "X.Y-<stage>N" or "X.Y.Z-<stage>N"
# (e.g. 4.7-dev5, 4.7-beta5, 4.6.3-rc2). We deliberately do NOT hardcode the
# stage names (dev/beta/rc); any lowercase suffix is accepted so that a new
# stage Godot might introduce is picked up automatically. Stable releases
# ("X.Y-stable") are excluded by the prerelease flag, not this pattern.
PRERELEASE_TAG = /\A\d+\.\d+(?:\.\d+)?-[a-z]+\d*\z/

# Extract version tags that are prereleases and match the pattern
def extract_versions(releases)
  releases.select { |r|
    r['prerelease'] && r['tag_name'] =~ PRERELEASE_TAG
  }
  .sort_by { |r| r['published_at'] }
  .reverse
  .take(5)
  .map { |r| r['tag_name'] }
end

def read_latest_release
  if File.exist?('latest_release.txt')
    File.read('latest_release.txt').strip
  else
    nil
  end
end

def write_latest_release(version)
  File.write('latest_release.txt', version)
end

# Compute sha256 checksum for a given asset URL
def compute_sha256(asset_url)
  begin
    uri = URI(asset_url)
    puts "Downloading asset to compute sha256: #{asset_url}"
    # Open the URI and read in binary mode
    asset_data = URI.open(uri, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE).read
    sha256 = Digest::SHA256.hexdigest(asset_data)
    puts "Computed sha256: #{sha256}"
    sha256
  rescue StandardError => e
    puts "Failed to download or compute sha256 for #{asset_url}: #{e.message}"
    nil
  end
end

# Generate the cask content with sha256 checksum
def generate_cask_content(version, sha256_checksum, latest = false)
  cask_name = latest ? "godot-dev" : "godot-dev@#{version}" 
  app_target = "Godot Dev.app"

  <<~RUBY
    cask "#{cask_name}" do
      version "#{version}"
      sha256 "#{sha256_checksum}"

      url "https://github.com/godotengine/godot-builds/releases/download/#{version}/Godot_v#{version}_macos.universal.zip",
          verified: "github.com/godotengine/godot-builds/"
      name "Godot Engine #{latest ? '(Latest)' : "(Build #{version})"}"
      desc "Free and open source 2D and 3D game engine #{latest ? '(Latest godot-builds release)' : "(godot-builds release#{version})"}"
      homepage "https://godotengine.org/"

      livecheck do
        #{latest ? 'url "https://github.com/godotengine/godot-builds/releases"' : 'skip "This is a versioned cask"'}
        #{latest ? 'strategy :github_latest' : ''}
        #{latest ? 'regex(/^(\d+\.\d+(?:\.\d+)?-(?:dev|beta|rc)\d+)$/)' : ''}
      end

      auto_updates true
      conflicts_with cask: #{latest ? '"godot-dev@*"' : '"godot-dev"'}

      app "Godot.app", target: "#{app_target}"

      binary "\#{appdir}/#{app_target}/Contents/MacOS/Godot", target: "godot-dev"

      zap trash: [
        "~/Library/Application Support/Godot",
        "~/Library/Caches/Godot",
        "~/Library/Saved Application State/org.godotengine.godot.savedState",
      ]
    end
  RUBY
end

# Write the cask file if it has changed
def write_cask_file(name, content)
  FileUtils.mkdir_p('Casks')
  cask_path = "Casks/#{name}.rb"

  if File.exist?(cask_path)
    existing_content = File.read(cask_path)
    if existing_content == content
      puts "Cask #{name} is already up to date. No changes made."
      return
    else
      puts "Cask #{name} exists but has updates. Overwriting."
    end
  else
    puts "Creating new cask #{name}."
  end

  File.write(cask_path, content)
  puts "Cask #{name} has been updated."
end

# Update casks with the latest versions
def update_casks(versions)
  # versioned casks
  versions.each do |version|
    asset_name = "Godot_v#{version}_macos.universal.zip"
    asset_url = "https://github.com/godotengine/godot-builds/releases/download/#{version}/#{asset_name}"
    sha256_checksum = compute_sha256(asset_url)
    if sha256_checksum
      cask_content = generate_cask_content(version, sha256_checksum)
      write_cask_file("godot-dev@#{version}", cask_content)
    else
      puts "Skipping cask for #{version} due to missing sha256 checksum."
    end
  end

  # latest cask
  latest_version = versions.first
  asset_name = "Godot_v#{latest_version}_macos.universal.zip"
  asset_url = "https://github.com/godotengine/godot-builds/releases/download/#{latest_version}/#{asset_name}"
  sha256_checksum = compute_sha256(asset_url)
  if sha256_checksum
    latest_cask_content = generate_cask_content(latest_version, sha256_checksum, true)
    write_cask_file("godot-dev", latest_cask_content)
  else
    puts "Skipping latest cask update due to missing sha256 checksum for #{latest_version}."
  end
end

def main
  releases = fetch_releases

  # Hard-fail (non-zero exit) on these so the scheduled workflow surfaces a
  # failure email instead of silently going stale, which is exactly how the
  # missing-beta-builds gap went unnoticed.
  if releases.empty?
    abort "ERROR: could not fetch any releases from godot-builds (API failure). Failing loudly so this is visible."
  end

  versions = extract_versions(releases)

  if versions.empty?
    abort "ERROR: fetched #{releases.size} releases but none matched the prerelease pattern #{PRERELEASE_TAG.inspect}. Godot's tag format may have changed — update extract_versions."
  end

  latest_release = read_latest_release
  if latest_release == versions.first
    puts "No new releases since last update (#{latest_release}). Exiting."
    exit 0
  end
  
  update_casks(versions)
  write_latest_release(versions.first)
end

main
