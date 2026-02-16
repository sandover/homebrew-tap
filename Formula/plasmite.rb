class Plasmite < Formula
  desc "Plasmite CLI"
  homepage "https://github.com/sandover/plasmite"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.3.0/plasmite_0.3.0_darwin_arm64.tar.gz"
      sha256 "6b975796590ce7cfe639f7ba09cea9953ec26c8c92de9b9bec2d744e1e82d38a"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.3.0/plasmite_0.3.0_darwin_amd64.tar.gz"
      sha256 "a96cd9a825610b2f3c42206cea024825265bb97194396f4b1ae8cbf2ff1b5f7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.3.0/plasmite_0.3.0_linux_arm64.tar.gz"
      sha256 "4ae1e26013044f060f83f0df022e05a424efa2f9988154ac57aca6322cb62862"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.3.0/plasmite_0.3.0_linux_amd64.tar.gz"
      sha256 "959dfee3b9acc93d50021da508ad6e43195d63e7dcfded17b15696842098ff27"
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
