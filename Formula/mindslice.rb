class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.2/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "5d396203a12b5ba125951a4e6752bb8c2e321fb558ab585970d6bb0ea37885de"

  depends_on "git"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.2/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "3ac2f3076beaffe6aef9be99f6a0bf2e3d24869ebda447795ae1892c9edecb53"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.2/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "5d396203a12b5ba125951a4e6752bb8c2e321fb558ab585970d6bb0ea37885de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.2/mindslice-cli_linux_amd64.tar.gz"
      sha256 "1b79090047f3a7d5be2a2bb1f642e30010bb482a75cbb6a4a9b07313187c9496"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.2/mindslice-cli_linux_arm64.tar.gz"
      sha256 "66f3436d0e92399baa55fecb8bef3d8e8de77cea5f21b1997ffa07f30d2af2ce"
    end
  end

  def install
    bin.install "mindslice"
  end

  test do
    system bin/"mindslice", "--help"
  end
end
