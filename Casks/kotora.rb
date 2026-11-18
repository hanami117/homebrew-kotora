cask "kotora" do
  version "0.4.1"
  sha256 "96ee351aee35c8a844c2d809795747664ff0853f1eaadc78a3c1f6fb34ab9a80"

  url "https://github.com/hanami117/kotora/releases/download/v#{version}/Kotora-#{version}.dmg"
  name "Kotora"
  desc "Anime and manga tracker for MyAnimeList and AniList"
  homepage "https://kotora.moe/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app's update notice only points to the package manager; it never replaces itself.
  auto_updates false
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Kotora.app"
  binary "#{appdir}/Kotora.app/Contents/MacOS/kot"

  uninstall quit: "io.github.hanami117.kotora"

  # Kotora keeps its files in XDG folders on macOS too (core/src/paths.rs). The sign-in token is in
  # tokens.json under the data folder, so zap removes it as well.
  zap trash: [
    "~/.cache/kotora",
    "~/.config/kotora",
    "~/.local/share/kotora",
  ]

  caveats <<~EOS
    Kotora is not notarized, so macOS refuses the first launch. Open
      System Settings → Privacy & Security
    and click "Open Anyway". Or run:
      xattr -dr com.apple.quarantine #{appdir}/Kotora.app
  EOS
end
