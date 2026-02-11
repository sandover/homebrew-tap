class Plasmite < Formula
  desc "Plasmite CLI"
  homepage "https://github.com/sandover/plasmite"
  license "MIT"
  version "0.1.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.1.14/plasmite_0.1.14_darwin_arm64.tar.gz"
      sha256 "09213e8621c69771383225bd6b74b5c45434c089cc05ef510957d738186e41c5"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.1.14/plasmite_0.1.14_darwin_amd64.tar.gz"
      sha256 "1bcd4a361772575c36103124b1b9d82ae784367ebc2a37d8b0af2fede81d2df4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.1.14/plasmite_0.1.14_linux_arm64.tar.gz"
      sha256 "4384ed4aa5c262731924b4500cf368eb0f3d0f0dc57735ba829da470f1d3b5fc"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.1.14/plasmite_0.1.14_linux_amd64.tar.gz"
      sha256 "6173884a3d605880d9a3c655fe47e0f8db81456f10c349b7880aca273e4635a8"
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
