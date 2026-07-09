cask "snapbar" do
  version "0.1.3"
  sha256 "e0d26499c95b05e99c209f420c93e37107b94afca043198fd91be5fffabb1371"

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
