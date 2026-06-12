cask "godot-dev" do
  version "4.7-rc2"
  sha256 "bb312b9f8b10a8c3b3c0516e61932f6b73afcc08cb07af58deb098454dedaded"

  url "https://github.com/godotengine/godot-builds/releases/download/4.7-rc2/Godot_v4.7-rc2_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Latest)"
  desc "Free and open source 2D and 3D game engine (Latest godot-builds release)"
  homepage "https://godotengine.org/"

  livecheck do
    url "https://github.com/godotengine/godot-builds/releases"
    strategy :github_latest
    regex(/^(\d+\.\d+(?:\.\d+)?-[a-z]+\d*)$/)
  end

  auto_updates true
  conflicts_with cask: "godot-dev@*"
  depends_on :macos

  app "Godot.app", target: "Godot Dev.app"
  binary "#{appdir}/Godot Dev.app/Contents/MacOS/Godot", target: "godot-dev"

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
