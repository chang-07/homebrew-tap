# Renamed to `sylvester` in 0.2.0. Kept — frozen at the last SnapBar release — so that
# existing installs resolve to a deprecation notice on their next `brew upgrade` instead
# of failing with "cask not found" and silently never updating again.
cask "snapbar" do
  version "0.1.3"
  sha256 "e0d26499c95b05e99c209f420c93e37107b94afca043198fd91be5fffabb1371"

  # The repository was renamed; GitHub redirects the old path, but point at the current
  # one so the download doesn't depend on that redirect surviving.
  url "https://github.com/chang-07/sylvester/releases/download/v#{version}/SnapBar-#{version}-macos-arm64.dmg"
  name "SnapBar"
  desc "Menubar net-worth tracker across brokerages via SnapTrade (renamed to Sylvester)"
  homepage "https://github.com/chang-07/sylvester"

  deprecate! date: "2026-07-26", because: "was renamed to `sylvester`"

  depends_on arch:  :arm64
  depends_on macos: :sonoma

  app "SnapBar.app"

  zap trash: [
    "~/.config/snapbar",
    "~/Library/Preferences/com.chang.snapbar.plist",
  ]

  caveats <<~EOS
    SnapBar is now Sylvester. This cask is frozen at 0.1.3 and will not receive
    further updates. To move over:

      brew uninstall --cask snapbar
      brew install --cask chang-07/tap/sylvester

    Your connection, preferences and net-worth history carry over on first launch —
    nothing to re-enter, and the old SnapBar data is copied rather than moved.
  EOS
end
