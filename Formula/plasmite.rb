class Plasmite < Formula
  desc "Persistent JSON message queues with a CLI and native SDK"
  homepage "https://github.com/sandover/plasmite"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v1.0.0/plasmite_1.0.0_darwin_arm64.tar.gz"
      sha256 "b73125a80f311f218f6e71bd449ea780d37d7064336e7f92f9f73ec99e76af74"
    else
      url "https://github.com/sandover/plasmite/releases/download/v1.0.0/plasmite_1.0.0_darwin_amd64.tar.gz"
      sha256 "2ae9ff7d2f877f9275ce58411b950816be7a7f2baecd69f058c454d02081bb9a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sandover/plasmite/releases/download/v1.0.0/plasmite_1.0.0_linux_amd64.tar.gz"
      sha256 "5a4a3cb96fe2f88aa42d2c5ae3b61bcb8d2d592155c50ea7cc9b0bf0d421d560"
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
