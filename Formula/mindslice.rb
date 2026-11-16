class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.2/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "4dcdf60b7190940db6085c6242d694571bd5cea3ed29970426ab4f54d2a69533"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.2/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "a9dd12453b9bf233c3779b43a708676640614fc487ae3c7559aebc6ba31d7523"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.2/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "4dcdf60b7190940db6085c6242d694571bd5cea3ed29970426ab4f54d2a69533"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.2/mindslice-cli_linux_amd64.tar.gz"
      sha256 "9c3a25a86542d47a9894a82cdcc6d20a73082083c6b773bc7e8a301dbcb0eca0"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.2/mindslice-cli_linux_arm64.tar.gz"
      sha256 "b050f3fe2e004af3a0915c4361c29de5af5f586c49a6b3c9a0047746502ce709"
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
    environment_variables PATH: std_service_path_env,
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
