class Plasmite < Formula
  desc "Plasmite CLI"
  homepage "https://github.com/sandover/plasmite"
  license "MIT"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.6.0/plasmite_0.6.0_darwin_arm64.tar.gz"
      sha256 "9528f1288fabc952f9b04c624bc1794321c1aa28eac1c61a60124ce46d4867b4"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.6.0/plasmite_0.6.0_darwin_amd64.tar.gz"
      sha256 "895afe194b463efdfc889f9da63bbc00607920e6efb1cd5fb20fc0a73cdcaba8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.6.0/plasmite_0.6.0_linux_arm64.tar.gz"
      sha256 "de8382e9dab6d75073d0b4c67d47db4a788a420f7cd4f8574481871b463fd589"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.6.0/plasmite_0.6.0_linux_amd64.tar.gz"
      sha256 "2d63591e4f08c0c25e23f669d38edbefd7f294dd8868ce0525fcbff8d8ab2f97"
    end
  end

  def install
    bin.install "plasmite"
    bin.install "pls"
  end

  test do
    assert_match "plasmite", shell_output("#{bin}/plasmite")
  end
end
