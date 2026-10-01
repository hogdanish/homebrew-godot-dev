cask "godot-dev@4.8-dev7" do
  version "4.8-dev7"
  sha256 "83b93feed8117880adf6865011a8fa8a43e2234623d5d48cdb49a48fc210cc4a"

  url "https://github.com/godotengine/godot-builds/releases/download/4.8-dev7/Godot_v4.8-dev7_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.8-dev7)"
  desc "Free and open source 2D and 3D game engine (godot-builds release 4.8-dev7)"
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
