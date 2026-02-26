class Plasmite < Formula
  desc "Plasmite CLI"
  homepage "https://github.com/sandover/plasmite"
  license "MIT"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.5.1/plasmite_0.5.1_darwin_arm64.tar.gz"
      sha256 "0de05c2cf28c35e5e89c97c85c1634abe4f014650555194e3ec4c8e6747701f5"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.5.1/plasmite_0.5.1_darwin_amd64.tar.gz"
      sha256 "4e1c14365fcdffa50c824b774da1f32ff844f3f3f788401b3853f6aba9ebfad7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sandover/plasmite/releases/download/v0.5.1/plasmite_0.5.1_linux_arm64.tar.gz"
      sha256 "64e6490662156f1a791958c003182a764b170db4dd6df8378151c7e3837551b3"
    else
      url "https://github.com/sandover/plasmite/releases/download/v0.5.1/plasmite_0.5.1_linux_amd64.tar.gz"
      sha256 "759b4fb0a3d890bfe4423e834eca9be0296ef804bb5b01218171f2fee69ef6a1"
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
