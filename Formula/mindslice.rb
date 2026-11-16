class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.7/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "4bbc7d02b937af0633532bdb82a6e62c6c20b495687bc9b79f0511ae689482ba"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.7/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "73699ad4b7f6386de04be7e4ec4521abc23b02f8615a42ab2ee0a20e38a9700b"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.7/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "4bbc7d02b937af0633532bdb82a6e62c6c20b495687bc9b79f0511ae689482ba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.7/mindslice-cli_linux_amd64.tar.gz"
      sha256 "0aa53744462c800306844d72e0ce68ab4b00fdb3cc7a3f1b0899202ef50870ab"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.7/mindslice-cli_linux_arm64.tar.gz"
      sha256 "7e135395b66db13f0e92c54def5cb8ab3756469c67693ef6f0d6c00ef9c9e8c2"
    end
  end

  def install
    bin.install "mindslice"
  end

  test do
    system bin/"mindslice", "--help"
  end
end
