class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.5/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "88e48774e9670e7a291c1a0835658945bb0bf229cb2946eee6be1c9672df6acc"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.5/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "4e08c19c767e3648f435e0eac48b8cb05c28924fa02f77f01756069c183ad0ac"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.5/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "88e48774e9670e7a291c1a0835658945bb0bf229cb2946eee6be1c9672df6acc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.5/mindslice-cli_linux_amd64.tar.gz"
      sha256 "c710326f76319a9efc3be52da9faae0f379ba974b7f98002f2f6f5c204164e1f"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.1.5/mindslice-cli_linux_arm64.tar.gz"
      sha256 "f6ad2d1abebed327a7bf891da74fa7f219ad32ee2cfa0bdfb697f1e4ca1b37d2"
    end
  end

  def install
    bin.install "mindslice"
  end

  test do
    system bin/"mindslice", "--help"
  end
end
