class Plasmite < Formula
  desc "Persistent JSON message queues with a CLI and native SDK"
  homepage "https://github.com/sandover/plasmite"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v1.2.0/plasmite_1.2.0_darwin_arm64.tar.gz"
      sha256 "aa659b5053be3e2e96ed5eb62c591cf8f2fdfd84c2c09c39b37b055df060f80d"
    else
      url "https://github.com/sandover/plasmite/releases/download/v1.2.0/plasmite_1.2.0_darwin_amd64.tar.gz"
      sha256 "0f25e53cb8885c22dfadb199f8bc824d392862371153656b62cd4e5e6059f30b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sandover/plasmite/releases/download/v1.2.0/plasmite_1.2.0_linux_amd64.tar.gz"
      sha256 "65f3eefc726d0d8505c1114d799b7551ea83ad8ada3ba4e27a42dd33580028d8"
    else
      odie "Plasmite is supported on x86_64 Linux only"
    end
  end

  def install
    bin.install "bin/plasmite", "bin/pls"
    include.install "include/plasmite.h"
    lib.install Dir["lib/libplasmite.*"]
    (lib/"pkgconfig").install "lib/pkgconfig/plasmite.pc"
  end

  test do
    system bin/"plasmite", "--version"
    system bin/"pls", "--version"
  end
end
