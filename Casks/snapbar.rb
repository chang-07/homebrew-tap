cask "snapbar" do
  version "0.1.2"
  sha256 "ab9022c0ab09c47825e3fdb251147eaf473259104d80abbd1e01d20c1a6826a1"

  url "https://github.com/chang-07/snapbar/releases/download/v#{version}/SnapBar-#{version}-macos-arm64.dmg"
  name "SnapBar"
  desc "Menubar net-worth tracker across brokerages via SnapTrade"
  homepage "https://github.com/chang-07/snapbar"

  depends_on arch:  :arm64
  depends_on macos: :sonoma

  app "SnapBar.app"

  zap trash: [
    "~/.config/snapbar",
    "~/Library/Preferences/com.chang.snapbar.plist",
  ]

  caveats <<~EOS
    SnapBar is ad-hoc signed (not notarized). The first time you open it,
    macOS Gatekeeper may block it. If so, remove the quarantine flag:

      xattr -cr "#{appdir}/SnapBar.app"

    then open it again — or install with `--no-quarantine` to skip this.
  EOS
end
