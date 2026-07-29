class Plasmite < Formula
  desc "Persistent JSON message queues with a CLI and native SDK"
  homepage "https://github.com/sandover/plasmite"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.7.2/plasmite_0.7.2_darwin_arm64.tar.gz"
      sha256 "7985f7e6f5a4a70cbd3580405c3491e325fb070507e7dbfccc96adc53505affd"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.7.2/plasmite_0.7.2_darwin_amd64.tar.gz"
      sha256 "135ed0a48aa92e037c7648a73bda3e1be82316bb70dae92a550b6b17bcddb999"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sandover/plasmite/releases/download/v0.7.2/plasmite_0.7.2_linux_amd64.tar.gz"
      sha256 "d096bc585baee26c41e0f2c2c148d849432564a120fa2b633af5b31d6184e2f4"
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
