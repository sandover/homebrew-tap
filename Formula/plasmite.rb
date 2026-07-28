class Plasmite < Formula
  desc "Persistent JSON message queues with a CLI and native SDK"
  homepage "https://github.com/sandover/plasmite"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.7.0/plasmite_0.7.0_darwin_arm64.tar.gz"
      sha256 "00d84c464f2e7e3dcfceadf44b0e5c16f0a97a34458b96efd23f18c892db656d"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.7.0/plasmite_0.7.0_darwin_amd64.tar.gz"
      sha256 "68470ac7ad39ce9c201cce2d2f74c59138e431edb97f154f76ae30397fec5500"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sandover/plasmite/releases/download/v0.7.0/plasmite_0.7.0_linux_amd64.tar.gz"
      sha256 "e836ea128ffdd099f3e15fe3a6abd1d28670e1817db2c61864deb63bb5ce6289"
    else
      odie "Plasmite is supported on x86_64 Linux only"
    end
  end

  def install
    bin.install "bin/plasmite", "bin/pls"
    include.install "include/plasmite.h"
    lib.install "lib/libplasmite.dylib", "lib/libplasmite.a"
    (lib/"pkgconfig").install "lib/pkgconfig/plasmite.pc"
  end

  test do
    system bin/"plasmite", "--version"
    system bin/"pls", "--version"
  end
end
