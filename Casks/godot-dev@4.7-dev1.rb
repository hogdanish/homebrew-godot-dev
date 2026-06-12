cask "godot-dev@4.7-dev1" do
  version "4.7-dev1"
  sha256 "d96c7a269ff5579ee989357c81e60f6766ad8d5efba42a6a3729001375027647"

  url "https://github.com/godotengine/godot-builds/releases/download/4.7-dev1/Godot_v4.7-dev1_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.7-dev1)"
  desc "Free and open source 2D and 3D game engine (godot-builds release 4.7-dev1)"
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
