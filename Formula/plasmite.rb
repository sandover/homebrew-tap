class Plasmite < Formula
  desc "Persistent JSON message queues with a CLI and native SDK"
  homepage "https://github.com/sandover/plasmite"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v1.1.0/plasmite_1.1.0_darwin_arm64.tar.gz"
      sha256 "26586e23a527fafffc5bd248bd6aced3f3b35405f7c7ac73fb4e2f974d8ae648"
    else
      url "https://github.com/sandover/plasmite/releases/download/v1.1.0/plasmite_1.1.0_darwin_amd64.tar.gz"
      sha256 "0350b6b7a1d32d7fad13810bfed4d4bfce3d1d5344d6b4ddc288e1a6866ca382"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sandover/plasmite/releases/download/v1.1.0/plasmite_1.1.0_linux_amd64.tar.gz"
      sha256 "38e4948c5b30fbaa3d768b3b74770be2ab019eed3850900e3532cb19194140dc"
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
