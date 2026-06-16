cask "godot-dev@4.6-beta3" do
  version "4.6-beta3"
  sha256 "96249eb1840108652b7c35104b3e7a5531fbfb511f9d49f57ac3b9b22609f07e"

  url "https://github.com/godotengine/godot-builds/releases/download/4.6-beta3/Godot_v4.6-beta3_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.6-beta3)"
  desc "Free and open source 2D and 3D game engine (godot-builds release 4.6-beta3)"
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
