cask "godot-dev@4.7-beta5" do
  version "4.7-beta5"
  sha256 "c213b496fca43eae75baa6b6d7e6a62c85bc24dd85068d4ea37ce53a0cad3e29"

  url "https://github.com/godotengine/godot-builds/releases/download/4.7-beta5/Godot_v4.7-beta5_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.7-beta5)"
  desc "Free and open source 2D and 3D game engine (godot-builds release 4.7-beta5)"
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
