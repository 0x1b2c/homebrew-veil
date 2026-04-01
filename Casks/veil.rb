cask "veil" do
  version "0.4.2"
  sha256 "e0595a17ede55db643891d5153199494b263d91f53a3816feeac013b2249ef3d"

  url "https://github.com/rainux/Veil/releases/download/v#{version}/Veil.zip"
  name "Veil"
  desc "A quiet, vanilla Neovim GUI for macOS"
  homepage "https://github.com/rainux/Veil"

  depends_on macos: ">= :sonoma"

  app "Veil.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Veil.app"]
  end

  binary "#{appdir}/Veil.app/Contents/bin/veil"
  binary "#{appdir}/Veil.app/Contents/bin/gvim", target: "gvim"
  binary "#{appdir}/Veil.app/Contents/bin/gvimdiff", target: "gvimdiff"

  zap trash: [
    "~/Library/Preferences/org.1b2c.Veil.plist",
  ]
end
