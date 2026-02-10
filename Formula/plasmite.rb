class Plasmite < Formula
  desc "Plasmite CLI"
  homepage "https://github.com/sandover/plasmite"
  license "MIT"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.1.9/plasmite_0.1.9_darwin_arm64.tar.gz"
      sha256 "88ec295854b7ec3d4655b23320f41a354b477de8e2755054730f44e2a06df2ee"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.1.9/plasmite_0.1.9_darwin_amd64.tar.gz"
      sha256 "739095048e120b235f0ad94239dadfcfe2066ee3672a22cfc0c76c6d1ac85772"
    end
  end

  on_linux do
    url "https://github.com/sandover/plasmite/releases/download/v0.1.9/plasmite_0.1.9_linux_amd64.tar.gz"
    sha256 "5f95410c80f6f9f0e4f95a3da5037e6760849d1effd0981d4924ea0396dae273"
  end

  def install
    bin.install "plasmite"
    bin.install "pls"
  end

  test do
    assert_match "plasmite", shell_output("#{bin}/plasmite")
  end
end
