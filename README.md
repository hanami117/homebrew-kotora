# Homebrew tap for Kotora

[Kotora](https://kotora.moe) is an anime tracker for Linux and macOS. It notices the episode you play in mpv, IINA or VLC and asks before it updates your MyAnimeList.
This tap installs the macOS app (Apple silicon, macOS 13 Ventura or later) and the `kot` command.

## Install

```sh
brew install --cask hanami117/kotora/kotora
```

That command adds the tap and marks the cask as trusted. Homebrew 7 and later loads casks from other taps only when they are trusted.
If you add the tap with `brew tap hanami117/kotora` instead, run `brew trust --cask hanami117/kotora/kotora` before `brew install --cask kotora`.

### First launch

Kotora is signed ad hoc and is not notarized, so macOS refuses the first launch.
Open **System Settings → Privacy & Security** and click **Open Anyway**. You need to do this only once.
Or run this command before you launch the app:

```sh
xattr -dr com.apple.quarantine /Applications/Kotora.app
```

## Upgrade

```sh
brew update
brew upgrade --cask kotora
```

The app tells you when a new version is out. It does not update itself.

## Uninstall

```sh
brew uninstall --cask kotora
```

This removes the app and `kot`. Your list, sign-in and settings stay on the Mac.
To remove them too:

```sh
brew uninstall --zap --cask kotora
```

## Problems

Report problems with the app at https://github.com/hanami117/kotora/issues.
