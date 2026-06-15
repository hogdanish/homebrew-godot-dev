cask "godot-dev@4.7-rc3" do
  version "4.7-rc3"
  sha256 "3a62023ed3bf5f0673cbf9e23648f400f94939e6904468075d49e45e8c70504d"

  url "https://github.com/godotengine/godot-builds/releases/download/4.7-rc3/Godot_v4.7-rc3_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.7-rc3)"
  desc "Free and open source 2D and 3D game engine (godot-builds release 4.7-rc3)"
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
