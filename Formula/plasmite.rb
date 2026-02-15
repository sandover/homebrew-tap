class Plasmite < Formula
  desc "Plasmite CLI"
  homepage "https://github.com/sandover/plasmite"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.2.0/plasmite_0.2.0_darwin_arm64.tar.gz"
      sha256 "0cd225a2ffce0a9628425c38adf603fca971889ed231f62a17131499c2a69660"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.2.0/plasmite_0.2.0_darwin_amd64.tar.gz"
      sha256 "dc65f716a2ffdec4620e1600defe301aae4dbeb275f82bc791441099b21c206a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.2.0/plasmite_0.2.0_linux_arm64.tar.gz"
      sha256 "5e0dbda733ec50b974842571f66155ea320ebfd413e4ab83b40f5cdd08e7e7af"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.2.0/plasmite_0.2.0_linux_amd64.tar.gz"
      sha256 "bfa73bf1bce928573590f3346c7b3a0ebd39a9e88ab73175a9e2e79fdbbe41c4"
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
