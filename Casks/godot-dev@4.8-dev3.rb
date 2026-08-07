cask "godot-dev@4.8-dev3" do
  version "4.8-dev3"
  sha256 "ec850b9cf290a9faa875550e1e35f83512ab256ab5594efde1813f90178dc09d"

  url "https://github.com/godotengine/godot-builds/releases/download/4.8-dev3/Godot_v4.8-dev3_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.8-dev3)"
  desc "Free and open source 2D and 3D game engine (godot-builds release 4.8-dev3)"
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
