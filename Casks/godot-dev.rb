cask "godot-dev" do
  version "4.7.1-rc1"
  sha256 "134ad58d3ebe4e504699fd65f00183bdc8fb952a7c53a2fe6fe0f3191fa3087f"

  url "https://github.com/godotengine/godot-builds/releases/download/4.7.1-rc1/Godot_v4.7.1-rc1_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Latest)"
  desc "Free and open source 2D and 3D game engine (Latest godot-builds release)"
  homepage "https://godotengine.org/"

  livecheck do
    url "https://github.com/godotengine/godot-builds/releases"
    strategy :github_latest
    regex(/^(\d+\.\d+(?:\.\d+)?-[a-z]+\d*)$/)
  end

  auto_updates true
  conflicts_with cask: "godot-dev@*"
  depends_on :macos

  app "Godot.app", target: "Godot Dev.app"
  binary "#{appdir}/Godot Dev.app/Contents/MacOS/Godot", target: "godot-dev"

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
