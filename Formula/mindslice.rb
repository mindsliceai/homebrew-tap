class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.3/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "208062fa4b34b95fbd3484eff99b73af35f7f2bee0e3e78dfad9a66980ce0d55"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.3/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "f55750b6717b9f47efcdfb8c7dea885623383540715fcc784b60a7efa30dac29"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.3/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "208062fa4b34b95fbd3484eff99b73af35f7f2bee0e3e78dfad9a66980ce0d55"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.3/mindslice-cli_linux_amd64.tar.gz"
      sha256 "435438cd81c3bcee6d86b3e57863703b16202bd748c0917273a8c83a2126bc49"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.3/mindslice-cli_linux_arm64.tar.gz"
      sha256 "46a9bc4b3f4e33ec12e684973bf8add400c39b661321c7c64d8edeac7ec7d5ee"
    end
  end

  def install
    bin.install "mindslice"
  end

  test do
    system bin/"mindslice", "--help"
  end
end
