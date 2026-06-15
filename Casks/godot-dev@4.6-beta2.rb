cask "godot-dev@4.6-beta2" do
  version "4.6-beta2"
  sha256 "79aa5dd7adb02d93c1c85ff54e5fc6944f02358322bee83e7b19764bd5b1d5d7"

  url "https://github.com/godotengine/godot-builds/releases/download/4.6-beta2/Godot_v4.6-beta2_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.6-beta2)"
  desc "Free and open source 2D and 3D game engine (godot-builds release 4.6-beta2)"
  homepage "https://godotengine.org/"

  livecheck do
    skip "This is a versioned cask"
  end

  auto_updates true
  conflicts_with cask: "godot-dev"
  depends_on :macos

  app "Godot.app", target: "Godot Dev.app"
  binary "#{appdir}/Godot Dev.app/Contents/MacOS/Godot", target: "godot-dev"

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
