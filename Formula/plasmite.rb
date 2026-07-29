class Plasmite < Formula
  desc "Persistent JSON message queues with a CLI and native SDK"
  homepage "https://github.com/sandover/plasmite"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.8.0/plasmite_0.8.0_darwin_arm64.tar.gz"
      sha256 "90f37f90678cc0ffec07d2997a1299bdbcc1a49ed23d80decec47ebc46c89a77"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.8.0/plasmite_0.8.0_darwin_amd64.tar.gz"
      sha256 "eec00a10b41b01b14fd2b04d01b11b4bd0e327ff675f3763b76a2445e0207b30"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sandover/plasmite/releases/download/v0.8.0/plasmite_0.8.0_linux_amd64.tar.gz"
      sha256 "71d447fb869f82925ab09d1a9baa4fd236243ab129218b0d0ec41091dd55aef0"
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
