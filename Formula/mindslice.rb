class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.6/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "45065ee1bd41088fdcc04f04b3ef99b86d431c77d7c60de8edb3c2b178370f31"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.6/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "1782790f40451448eb2613a1e5917e1173aba473dacabd6ce436d6e8171cc839"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.6/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "45065ee1bd41088fdcc04f04b3ef99b86d431c77d7c60de8edb3c2b178370f31"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.6/mindslice-cli_linux_amd64.tar.gz"
      sha256 "3cc2c793a401ca649dd75a30f14dee6743e5314fc5b8f56e5ee1964948bd62c7"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.6/mindslice-cli_linux_arm64.tar.gz"
      sha256 "4aef9c97cb6ebeba867c495b9e6fab3e31fcca58518a24b75297d8e43653234a"
    end
  end

  def install
    bin.install "mindslice"
  end

  test do
    system bin/"mindslice", "--help"
  end
end
