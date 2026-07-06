cask "godot-dev@4.8-dev1" do
  version "4.8-dev1"
  sha256 "0337f04e3375bb39039b3f4712bb3f682c5d1cced083f6511e18a050b21142d0"

  url "https://github.com/godotengine/godot-builds/releases/download/4.8-dev1/Godot_v4.8-dev1_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.8-dev1)"
  desc "Free and open source 2D and 3D game engine (godot-builds release 4.8-dev1)"
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
