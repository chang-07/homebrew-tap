cask "rascal" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.6"
  sha256 arm:   "f0a92aea757341c61f3816af979745372ddb9ca12b2181a81da53494e4f510c0",
         intel: "e78d2911f6b205836aab5b9ac0758e5e7e7af787b7a5e22e2941c9431e9922f5"

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
