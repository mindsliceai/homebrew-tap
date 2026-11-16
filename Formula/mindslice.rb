class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.3/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "22e5dcbdc0d233fb14ab447c6be2a20f80760ef38a2432a620f37d51023fa96a"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.3/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "95bb13637fab5b566c0d56962cce7a149af9d84d05f77210415daf34a06eade6"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.3/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "22e5dcbdc0d233fb14ab447c6be2a20f80760ef38a2432a620f37d51023fa96a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.3/mindslice-cli_linux_amd64.tar.gz"
      sha256 "c5bb55493966331be15631d78ff57932e6a2eb8b3ca73384087824d90685abc0"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.3/mindslice-cli_linux_arm64.tar.gz"
      sha256 "05cbb05b7e2668d9d0ead6db2cfd9d2f1e1abc1d5e678a1fcccb18d1c82e1352"
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
