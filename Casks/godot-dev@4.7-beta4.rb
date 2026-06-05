cask "godot-dev@4.7-beta4" do
  version "4.7-beta4"
  sha256 "23494e5a7c05d187cb13c80e19c6c329154c2c0048821f356ce2735d94e47f09"

  url "https://github.com/godotengine/godot-builds/releases/download/4.7-beta4/Godot_v4.7-beta4_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.7-beta4)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.7-beta4)"
  homepage "https://godotengine.org/"

  livecheck do
    skip "This is a versioned cask"
    
    
  end

  auto_updates true
  conflicts_with cask: "godot-dev"

  app "Godot.app", target: "Godot Dev.app"

  binary "#{appdir}/Godot Dev.app/Contents/MacOS/Godot", target: "godot-dev"

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
