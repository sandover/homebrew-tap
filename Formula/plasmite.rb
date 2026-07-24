class Plasmite < Formula
  desc "Persistent JSON message queues with a CLI and native SDK"
  homepage "https://github.com/sandover/plasmite"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.6.1/plasmite_0.6.1_darwin_arm64.tar.gz"
      sha256 "5c1c79d50ec903fb9378e1f530e933be60bafcdd76bc688bfd4b108aee81a267"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.6.1/plasmite_0.6.1_darwin_amd64.tar.gz"
      sha256 "61201207ef21f2ed8841139af914a9bbd5f4e97af93feedaf6c4a8f70adf907b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.6.1/plasmite_0.6.1_linux_arm64.tar.gz"
      sha256 "022561d86ea0ab5499b8a6ff02c71684099f5c666aee0ef89c569ed852cc3637"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.6.1/plasmite_0.6.1_linux_amd64.tar.gz"
      sha256 "ce0a260b38f849437845bfe0d98797bfa283d39e97f8e25873c3e9fff6603c21"
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
