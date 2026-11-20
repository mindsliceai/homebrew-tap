class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.3.1/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "b7d9abeae1911ff803168c966fa9f8f420a3ffd2ab1776cb9b5fa74ffc06aebf"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.3.1/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "6f79bc86829451c32f4a27636c9d7b5a02236a9a722cb47627626879d97da862"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.3.1/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "b7d9abeae1911ff803168c966fa9f8f420a3ffd2ab1776cb9b5fa74ffc06aebf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.3.1/mindslice-cli_linux_amd64.tar.gz"
      sha256 "2bcf534bddbc53b64888a3c85c7034af3b24c860ebb0d83c001d5fc23e7d2737"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.3.1/mindslice-cli_linux_arm64.tar.gz"
      sha256 "da8323909e62ae82e3eae5eaa4ac41cab5a5efffe75a4a49d83bd31d83588867"
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
      After upgrading, run mindslice service restart to start and verify the installed version.
    EOS
  end

  test do
    system bin/"mindslice", "--help"
  end
end
