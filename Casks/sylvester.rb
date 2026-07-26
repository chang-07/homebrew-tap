cask "sylvester" do
  version "0.2.0"
  sha256 "4d3c1f42a3d501bfefa89c8d35e15a01d44d133d6547ef0c12d641bc0b0c96cc"

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
