cask "godot-dev@4.6.3-rc2" do
  version "4.6.3-rc2"
  sha256 "1146c6f6f78205ebb2b7e67f169c0e526f8df3b715088ac5f5d16f53cbde52f2"

  url "https://github.com/godotengine/godot-builds/releases/download/4.6.3-rc2/Godot_v4.6.3-rc2_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.6.3-rc2)"
  desc "Free and open source 2D and 3D game engine (godot-builds release 4.6.3-rc2)"
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
