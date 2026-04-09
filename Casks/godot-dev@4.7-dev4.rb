cask "godot-dev@4.7-dev4" do
  version "4.7-dev4"
  sha256 "477f09d50258a88326be72e62b9c353ff1e4987532203faba79dbab3e6fdb307"

  url "https://github.com/godotengine/godot-builds/releases/download/4.7-dev4/Godot_v4.7-dev4_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.7-dev4)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.7-dev4)"
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
