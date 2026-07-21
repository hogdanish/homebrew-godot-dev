cask "godot-dev@4.8-dev2" do
  version "4.8-dev2"
  sha256 "7e156386ff40435c0cd9664b554726cc26b5c42b5aea4be8a698f453833b6b04"

  url "https://github.com/godotengine/godot-builds/releases/download/4.8-dev2/Godot_v4.8-dev2_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.8-dev2)"
  desc "Free and open source 2D and 3D game engine (godot-builds release 4.8-dev2)"
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
