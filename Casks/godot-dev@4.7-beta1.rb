cask "godot-dev@4.7-beta1" do
  version "4.7-beta1"
  sha256 "44a51eec229855f6bec6cf1756597bae1fc690b42e695f96a37ea7e0f3aad2d0"

  url "https://github.com/godotengine/godot-builds/releases/download/4.7-beta1/Godot_v4.7-beta1_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.7-beta1)"
  desc "Free and open source 2D and 3D game engine (godot-builds release 4.7-beta1)"
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
