cask "rascal" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.3"
  sha256 arm:   "38acd4f51807cd554ba8d0bebf9f5243fc6c938d79efa0ec5de25dc4b7d605c5",
         intel: "16df1682dfac8a7b2055b1ee4703404cd964000b91c05dea7181a4af444fd58a"

  url "https://github.com/chang-07/rascal/releases/download/v#{version}/Rascal-#{arch}.dmg"
  name "Rascal"
  desc "Fast, keyboard-first Finder replacement"
  homepage "https://github.com/chang-07/rascal"

  depends_on macos: :ventura

  app "Rascal.app"

  zap trash: [
    "~/Library/Application Support/FinderTwo",
    "~/Library/Preferences/dev.chang.FinderTwo.plist",
    "~/Library/Saved Application State/dev.chang.FinderTwo.savedState",
  ]

  caveats <<~EOS
    Rascal is ad-hoc signed (not notarized). The first time you open it,
    macOS Gatekeeper may block it. If so, remove the quarantine flag:

      xattr -cr "#{appdir}/Rascal.app"

    then open it again.
  EOS
end
