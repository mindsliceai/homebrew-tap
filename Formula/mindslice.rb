class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.5/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "3cd35e3b80a09b580b03c0b0b12bd265592c3559d66c0a86c509a52c07345fea"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.5/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "e528c17db4f3d27905ae17804a693159b9dff0cc92e9cab1abfa775b73863def"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.5/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "3cd35e3b80a09b580b03c0b0b12bd265592c3559d66c0a86c509a52c07345fea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.5/mindslice-cli_linux_amd64.tar.gz"
      sha256 "776d4911557249b2f8b0dd101d238718660cade77471f663d045e247858a252d"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.5/mindslice-cli_linux_arm64.tar.gz"
      sha256 "55a54835a1a6d9dde2c749af855a0bc5006e3935e568b26d4f2162125da0672f"
    end
  end

  def install
    bin.install "mindslice"
  end

  service do
    run [opt_bin/"mindslice", "service", "run"]
    keep_alive successful_exit: false
    throttle_interval 10
    restart_delay 10
    environment_variables PATH:            std_service_path_env,
                          XDG_CONFIG_HOME: ENV.fetch("XDG_CONFIG_HOME", "#{Dir.home}/.config")
    log_path var/"log/mindslice.log"
    error_log_path var/"log/mindslice.log"
  end

  def caveats
    <<~EOS
      Run mindslice init to set up your knowledge and choose automatic startup.
      You can change startup at any time with mindslice settings.
      After upgrading, restart an enabled service with brew services restart mindslice.
    EOS
  end

  test do
    system bin/"mindslice", "--help"
  end
end
