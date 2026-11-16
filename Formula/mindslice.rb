class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.4/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "674ba3d4403d05091de19e696ffd751ba807cdf13f826d8c3a2ec0235d5bc7a9"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.4/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "1a9c6acaa30ce3de5aa0dda1a649a1fb125ffd0ce4bd3c7314c83b556edb268b"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.4/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "674ba3d4403d05091de19e696ffd751ba807cdf13f826d8c3a2ec0235d5bc7a9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.4/mindslice-cli_linux_amd64.tar.gz"
      sha256 "b191ce1679289bcb56487e9570fd0e484c739d5b4976c792b900d995b7f31441"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.4/mindslice-cli_linux_arm64.tar.gz"
      sha256 "a59ba2b83edf5f5d415a092c5f049a78b2295904c65635e642c22849be3d36cd"
    end
  end

  def install
    bin.install "mindslice"
  end

  test do
    system bin/"mindslice", "--help"
  end
end
