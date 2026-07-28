class Plasmite < Formula
  desc "Persistent JSON message queues with a CLI and native SDK"
  homepage "https://github.com/sandover/plasmite"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.7.1/plasmite_0.7.1_darwin_arm64.tar.gz"
      sha256 "1e0136cb33179d1bd35a0a1a8bdd3a34d8a2e5a65782da595a729be540079a22"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.7.1/plasmite_0.7.1_darwin_amd64.tar.gz"
      sha256 "f5da99cf067f34914ec20b71411103febb6068044ddda198257b641dbf66827b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sandover/plasmite/releases/download/v0.7.1/plasmite_0.7.1_linux_amd64.tar.gz"
      sha256 "92fd962a39ee22b9e8ed07a89ef263b9a1e68916dad8450642fa62bb444bb3dc"
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
