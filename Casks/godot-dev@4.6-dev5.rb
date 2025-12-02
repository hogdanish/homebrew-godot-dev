cask "godot-dev@4.6-dev5" do
  version "4.6-dev5"
  sha256 "2c6e833420786a6a0627c652026356f96177d0440576654bc09c5ea0661adcb8"

  url "https://github.com/godotengine/godot-builds/releases/download/4.6-dev5/Godot_v4.6-dev5_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.6-dev5)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.6-dev5)"
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
