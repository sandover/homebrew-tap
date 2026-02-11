class Plasmite < Formula
  desc "Plasmite CLI"
  homepage "https://github.com/sandover/plasmite"
  license "MIT"
  version "0.1.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.1.13/plasmite_0.1.13_darwin_arm64.tar.gz"
      sha256 "2d5d7020debb3c0bab3798e6d36252ce244b9ab81db320f5a7ede17457a917d4"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.1.13/plasmite_0.1.13_darwin_amd64.tar.gz"
      sha256 "01e3bdd2a7088d7defe22016d4dee03a10a4fa77f3e17aa7780277433b1e4e4d"
    end
  end

  on_linux do
    url "https://github.com/sandover/plasmite/releases/download/v0.1.13/plasmite_0.1.13_linux_amd64.tar.gz"
    sha256 "b07a2d712b776614f22e8821f4fb3a07e9494b090473680db7467af71529fa56"
  end

  def install
    bin.install "plasmite"
    bin.install "pls"
  end

  test do
    assert_match "plasmite", shell_output("#{bin}/plasmite")
  end
end
