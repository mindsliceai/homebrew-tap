class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.1/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "206e475093ee8ec42501cb0c9bfcf97f63d0fc3d675219354bde72d872734d00"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.1/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "6c8260fe036dd099905764ec8082522d3d05e8185d622e50fb2d65d17d7e7059"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.1/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "206e475093ee8ec42501cb0c9bfcf97f63d0fc3d675219354bde72d872734d00"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.1/mindslice-cli_linux_amd64.tar.gz"
      sha256 "adb2ecaaf9e94900a52328420c428e47c89ceb92647af42b6d0bfe82c6d261fe"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.1/mindslice-cli_linux_arm64.tar.gz"
      sha256 "c4df3f80b171946bb885e88c4f058afec6ad301043a6171aedf0645b7da1e10b"
    end
  end

  def install
    bin.install "mindslice"
  end

  test do
    system bin/"mindslice", "--help"
  end
end
