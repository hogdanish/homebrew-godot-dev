cask "godot-dev@4.7-dev5" do
  version "4.7-dev5"
  sha256 "3b4d41f674bb24125bcf63db6a9523a8954b5fe93e0aacc68cd42ba2d0bc67af"

  url "https://github.com/godotengine/godot-builds/releases/download/4.7-dev5/Godot_v4.7-dev5_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.7-dev5)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.7-dev5)"
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
