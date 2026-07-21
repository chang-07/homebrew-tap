cask "rascal" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.5"
  sha256 arm:   "c63ff96aaf0c4d6024ac47bc48d653cdd48d86e6a18f4447bb1ad4ea26fff939",
         intel: "5dad4a034fcc896b60980e31f4d325193ec04dafce9b1fc451cbb11b1c14b84c"

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
