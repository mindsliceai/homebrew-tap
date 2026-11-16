class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.1/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "267e738e26ae319798c6dce23bbf4a3f0ec163eeea0716639dc23ecd7beeb19c"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.1/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "41a9b81f83031cc787b20cb278c0af9e3952abeaf8d01399a1937b47b90a7e11"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.1/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "267e738e26ae319798c6dce23bbf4a3f0ec163eeea0716639dc23ecd7beeb19c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.1/mindslice-cli_linux_amd64.tar.gz"
      sha256 "b4bf3f6ceea691c70e99ac1a47921ebe0017fdd293e6cbd615e0b30139ceb36e"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.1/mindslice-cli_linux_arm64.tar.gz"
      sha256 "1441079f5901c71a8219416a499e25751fd3812ad9851128c32cdcb74eb5185f"
    end
  end

  def install
    bin.install "mindslice"
  end

  test do
    system bin/"mindslice", "--help"
  end
end
