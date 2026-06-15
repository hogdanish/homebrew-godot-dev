cask "godot-dev@4.6.1-rc1" do
  version "4.6.1-rc1"
  sha256 "07009bb203a5145acdc5143761f98428eafda89e4f33d431168865defe83a6a6"

  url "https://github.com/godotengine/godot-builds/releases/download/4.6.1-rc1/Godot_v4.6.1-rc1_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.6.1-rc1)"
  desc "Free and open source 2D and 3D game engine (godot-builds release 4.6.1-rc1)"
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
