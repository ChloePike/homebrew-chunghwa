cask "chunghwa" do
  version "0.2.0"
  sha256 arm:   "6df6cac3995c52ce0b0c01c9769fde3b4be0cdd425edf63a90bba1c8450fa8a5",
         intel: "71a7b8a78261fecb9bbc662d5ff3f4c672fffd8393fb68911283397fa508796f"

  arch arm: "arm64", intel: "x86_64"

  url "https://github.com/ChloePike/chunghwa/releases/download/v#{version}/ChungHwa-#{version}-#{arch}.dmg"
  name "ChungHwa"
  desc "Native macOS mihomo client"
  homepage "https://github.com/ChloePike/chunghwa"

  depends_on macos: ">= :tahoe"

  # `brew livecheck chunghwa` and `brew bump-cask-pr` use this to follow
  # the upstream tag scheme.
  livecheck do
    url :url
    strategy :github_latest
  end

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
