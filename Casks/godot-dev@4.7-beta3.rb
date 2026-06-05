cask "godot-dev@4.7-beta3" do
  version "4.7-beta3"
  sha256 "8ba1219029e913ac8b723259330799fa32abd36ceb8ab714cbeaef852f9199ef"

  url "https://github.com/godotengine/godot-builds/releases/download/4.7-beta3/Godot_v4.7-beta3_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.7-beta3)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.7-beta3)"
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
