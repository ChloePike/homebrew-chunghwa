cask "chunghwa" do
  version "0.1.0"
  sha256 arm:   "143d40e8105cc1c9a94dd84af9ac9697c3b2f116d2adf8754af46f0bbe15c571",
         intel: "2ed6d8403a08ae679a8e8718838950366017885f5f2c2b741eaaed1fc974a2e8"

  arch arm: "arm64", intel: "x86_64"

  url "https://github.com/ChloePike/chunghwa/releases/download/v#{version}/ChungHwa-#{version}-#{arch}.dmg"
  name "ChungHwa"
  desc "Native macOS mihomo client"
  homepage "https://github.com/ChloePike/chunghwa"

  depends_on macos: ">= :tahoe"

  app "ChungHwa.app"

  # ChungHwa is unsigned and unnotarized. Strip the quarantine xattr so
  # macOS doesn't pop a Gatekeeper alert on first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ChungHwa.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ChungHwa",
    "~/Library/Preferences/org.clash.ChungHwa.plist",
    "~/Library/Caches/org.clash.ChungHwa",
    "~/Library/Saved Application State/org.clash.ChungHwa.savedState",
    "~/Library/Logs/ChungHwa",
  ]
end
