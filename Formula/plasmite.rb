class Plasmite < Formula
  desc "Plasmite CLI"
  homepage "https://github.com/sandover/plasmite"
  license "MIT"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.5.0/plasmite_0.5.0_darwin_arm64.tar.gz"
      sha256 "4b623ff37d1f45e5b53787383081b5bb11779b719d88e53cd27cc46cc411c45f"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.5.0/plasmite_0.5.0_darwin_amd64.tar.gz"
      sha256 "c716449da2bf3b4017cb01d921e23c31035bbd4d60662d63800819a56d62e4a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.5.0/plasmite_0.5.0_linux_arm64.tar.gz"
      sha256 "4fb76b4e0266506e20d8923ed27edaaa759c3e5226431ee19f72e78ca2af9c35"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.5.0/plasmite_0.5.0_linux_amd64.tar.gz"
      sha256 "7e0aa016d38aeff63233319581d2559ca88f21cc1b1f7222f7a14fdb4929d3dd"
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
