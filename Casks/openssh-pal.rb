cask "openssh-pal" do
  version "0.2.0-beta.1"
  sha256 "a500fdae110f9db76c82203cfe6555b94249014dd5de7c79250462af6ceec982"

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
