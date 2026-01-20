cask "godot-dev@4.6-rc2" do
  version "4.6-rc2"
  sha256 "bf1b777a4e012f6a69b632371587d4d05031e953845666181e0a967a67a321cf"

  url "https://github.com/godotengine/godot-builds/releases/download/4.6-rc2/Godot_v4.6-rc2_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.6-rc2)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.6-rc2)"
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
