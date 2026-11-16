class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.0/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "9137331f78bd8e59297d521b02bc62de64cc48e7398e26a06a6ff09a170a250f"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.0/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "6cedaaaaee1e8998dd8ed6ee0f56abd524dd101620ffba7e219c04350c330be1"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.0/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "9137331f78bd8e59297d521b02bc62de64cc48e7398e26a06a6ff09a170a250f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.0/mindslice-cli_linux_amd64.tar.gz"
      sha256 "8512e0a01f609bd0514820ea9d50579a02be94676481948e797a2c9666c58b30"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.0/mindslice-cli_linux_arm64.tar.gz"
      sha256 "933568478e8db32b4260d6efb82d6a0f0897fc47dd615a060221d406bdfdcc3c"
    end
  end

  def install
    bin.install "mindslice"
  end

  test do
    system bin/"mindslice", "--help"
  end
end
