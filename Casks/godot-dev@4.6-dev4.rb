cask "godot-dev@4.6-dev4" do
  version "4.6-dev4"
  sha256 "9faae3c5e8917b68e38911cfade620f452c0688abdc18dccdc4dcbed06b364e6"

  url "https://github.com/godotengine/godot-builds/releases/download/4.6-dev4/Godot_v4.6-dev4_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.6-dev4)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.6-dev4)"
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
