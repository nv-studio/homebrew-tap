cask "openssh-pal" do
  version "0.1.0-beta.2"
  sha256 "aa29e18b99c9d888e3ea4ec1a2c057de31ddf18f05967c3d73b7e7a14844adc9"

  url "https://github.com/nv-studio/openssh-pal/releases/download/v#{version}/OpenSSH-Pal-#{version}.zip"
  name "OpenSSH Pal"
  desc "Menu bar app for managing OpenSSH hosts and keys"
  homepage "https://github.com/nv-studio/openssh-pal"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:-beta\.\d+)?)$/i)
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "OpenSSH Pal.app"

  uninstall quit: "com.nvstudio.opensshpal"

  zap trash: [
    "~/Library/Application Support/com.nvstudio.opensshpal",
    "~/Library/Caches/com.nvstudio.opensshpal",
    "~/Library/Preferences/com.nvstudio.opensshpal.plist",
  ]
  # NEVER zap ~/.ssh — it is the user's data, not app state.
end
