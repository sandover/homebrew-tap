class Plasmite < Formula
  desc "Plasmite CLI"
  homepage "https://github.com/sandover/plasmite"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.1.0/plasmite_0.1.0_darwin_arm64.tar.gz"
      sha256 "4b1bb3321ad67057111cac05613636c9de00405440b166b0b2f6763fdce7686a"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.1.0/plasmite_0.1.0_darwin_amd64.tar.gz"
      sha256 "9f5aa0d5bd54cfe21480cb80bbe4ce18c6cefb4f01e62d9dbf59dc79d10e1247"
    end
  end

  on_linux do
    url "https://github.com/sandover/plasmite/releases/download/v0.1.0/plasmite_0.1.0_linux_amd64.tar.gz"
    sha256 "95ae6edd5e673871561e3807ebb1a856729bbf6ed1cbfc9e34d07d23a48fa5c1"
  end

  def install
    bin.install "plasmite"
    bin.install "pls"
  end

  test do
    assert_match "plasmite", shell_output("#{bin}/plasmite")
  end
end
