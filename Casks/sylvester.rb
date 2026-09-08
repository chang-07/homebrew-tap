cask "sylvester" do
  version "0.3.0"
  sha256 "2001dcd61df4a38495b4956f20a01936cdce6f00209df44318ec1e5283287b78"

  url "https://github.com/chang-07/sylvester/releases/download/v#{version}/Sylvester-#{version}-macos-arm64.dmg"
  name "Sylvester"
  desc "Menubar net-worth tracker across brokerages via SnapTrade"
  homepage "https://github.com/chang-07/sylvester"

  depends_on arch:  :arm64
  depends_on macos: :sonoma

  app "Sylvester.app"

  zap trash: [
    "~/.config/sylvester",
    "~/Library/Preferences/com.chang.sylvester.plist",
  ]

  caveats <<~EOS
    Sylvester is ad-hoc signed (not notarized). The first time you open it,
    macOS Gatekeeper may block it. If so, remove the quarantine flag:

      xattr -cr "#{appdir}/Sylvester.app"

    then open it again — or install with `--no-quarantine` to skip this.

    Upgrading from SnapBar? Your connection, preferences and net-worth history
    carry over on first launch — nothing to re-enter. macOS will ask once for
    Keychain access; that is Sylvester reading the token SnapBar stored.
  EOS
end
