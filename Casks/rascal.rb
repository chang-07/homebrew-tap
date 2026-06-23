cask "rascal" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.4"
  sha256 arm:   "fa6554fcab75a83c9920024446d33fdb698d7e2c76aa4f25252d895bc4158dbb",
         intel: "f0476f992c24328cfb45d79f85bb56611f04442e5eb4f94d6f576638d419228c"

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
