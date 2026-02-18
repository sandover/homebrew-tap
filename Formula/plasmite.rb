class Plasmite < Formula
  desc "Plasmite CLI"
  homepage "https://github.com/sandover/plasmite"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.4.0/plasmite_0.4.0_darwin_arm64.tar.gz"
      sha256 "c802f436c6daa04f12dca6b7c0e6aa1550bb5e4df9b52ff5368b31c88566e315"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.4.0/plasmite_0.4.0_darwin_amd64.tar.gz"
      sha256 "915e582e46e9765d065ecc519db1c83e97e8c02192693fa9d51cd8c1ed57e625"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.4.0/plasmite_0.4.0_linux_arm64.tar.gz"
      sha256 "486e5d4f6d7414059dd5adb5eba8eecd28f2cb5ed1be4c2ec298043300fc04f8"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.4.0/plasmite_0.4.0_linux_amd64.tar.gz"
      sha256 "ec31904ab0c7bda0756f7ba73f71cfb776fcc5b0c0b1ab11b07bd38b1922b260"
    end
  end

  def install
    bin.install "plasmite"
    bin.install "pls"
  end

  test do
    assert_match "plasmite", shell_output("#{bin}/plasmite")
  end
end
