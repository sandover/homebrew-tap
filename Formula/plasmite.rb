class Plasmite < Formula
  desc "Plasmite CLI"
  homepage "https://github.com/sandover/plasmite"
  license "MIT"
  version "0.6.1"

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
    bin.install "plasmite"
    bin.install "pls"
  end

  test do
    assert_match "plasmite", shell_output("#{bin}/plasmite")
  end
end
