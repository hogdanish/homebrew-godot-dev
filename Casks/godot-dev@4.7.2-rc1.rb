cask "godot-dev@4.7.2-rc1" do
  version "4.7.2-rc1"
  sha256 "a061985fc5f567a53878db218b4b9e4c8978ec8a72aff25057d041cf89856380"

  url "https://github.com/godotengine/godot-builds/releases/download/4.7.2-rc1/Godot_v4.7.2-rc1_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.7.2-rc1)"
  desc "Free and open source 2D and 3D game engine (godot-builds release 4.7.2-rc1)"
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
