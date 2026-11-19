class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.3.0/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "7ab93caf02a2bf21e54989cd22fe79c2cebc652cfa7511967824c71d55b7b50d"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.3.0/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "016b5de441d22b9b8824b02f2c6e0174bcc3071905181f875efea84f6ebf65bf"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.3.0/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "7ab93caf02a2bf21e54989cd22fe79c2cebc652cfa7511967824c71d55b7b50d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.3.0/mindslice-cli_linux_amd64.tar.gz"
      sha256 "0b3c62d4b435b0562a6cb36af0a4597ecde58bd44fad18864435b4ce58ae0770"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.3.0/mindslice-cli_linux_arm64.tar.gz"
      sha256 "83b547c4d0794b25ed2c8cb85f22edf1c3ae326e474b52ab91710daa65e8c484"
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
