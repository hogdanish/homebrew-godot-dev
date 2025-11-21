cask "godot-dev@4.6-dev3" do
  version "4.6-dev3"
  sha256 "98a23e5286ac46853870406c66db16576f7fa2c7eb9a12a53adc784f9fd067c6"

  url "https://github.com/godotengine/godot-builds/releases/download/4.6-dev3/Godot_v4.6-dev3_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.6-dev3)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.6-dev3)"
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
