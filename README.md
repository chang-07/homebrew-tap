# chang-07/homebrew-tap

Homebrew tap for [Rascal](https://github.com/chang-07/rascal) — a fast,
keyboard-first Finder replacement for macOS.

## Install

```sh
brew install --cask chang-07/tap/rascal
```

Or tap first, then install:

```sh
brew tap chang-07/tap
brew install --cask rascal
```

## Update

```sh
brew upgrade --cask rascal
```

## Notes

Rascal is ad-hoc signed (not notarized). On first launch macOS Gatekeeper may
block it; if so, clear the quarantine flag and reopen:

```sh
xattr -cr /Applications/Rascal.app
```

## Maintainer

Bump the cask when a new release ships:

```sh
brew bump-cask-pr --version <X.Y.Z> rascal
```
