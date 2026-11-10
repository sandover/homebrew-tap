class Plasmite < Formula
  desc "Persistent JSON message queues with a CLI and native SDK"
  homepage "https://github.com/sandover/plasmite"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v1.3.0/plasmite_1.3.0_darwin_arm64.tar.gz"
      sha256 "5bbab77eb6952dbe93c59f06c145d48839ac17c93fa3818bc20646434441a5e9"
    else
      url "https://github.com/sandover/plasmite/releases/download/v1.3.0/plasmite_1.3.0_darwin_amd64.tar.gz"
      sha256 "cc59126c3afa94fa3e8c6d398e86ebd3115544cdb5d33e5a0f9668848a090b8d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sandover/plasmite/releases/download/v1.3.0/plasmite_1.3.0_linux_amd64.tar.gz"
      sha256 "f3c87abe91fc9be5c61a98ee7e9689556d5707a8af71e8061bd9325dc032d228"
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
