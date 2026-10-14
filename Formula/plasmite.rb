class Plasmite < Formula
  desc "Persistent JSON message queues with a CLI and native SDK"
  homepage "https://github.com/sandover/plasmite"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v1.2.1/plasmite_1.2.1_darwin_arm64.tar.gz"
      sha256 "3bbf7bbf877d5a490a6589bbcc39ff75d983785eb57ee7d6d65e4bce1db42145"
    else
      url "https://github.com/sandover/plasmite/releases/download/v1.2.1/plasmite_1.2.1_darwin_amd64.tar.gz"
      sha256 "c34ab2d418534e34eb5454d95c423a4843fdca89d7204c95852b0be567bd78a2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sandover/plasmite/releases/download/v1.2.1/plasmite_1.2.1_linux_amd64.tar.gz"
      sha256 "f33062d2a5b144e90aeadf324edba9a3cd6d055d62cb733022cf3a588c3b860c"
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
