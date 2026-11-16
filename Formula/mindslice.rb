class Mindslice < Formula
  desc "CLI and local service for Mindslice"
  homepage "https://github.com/mindsliceai/mindslice-releases"
  url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.4/mindslice-cli_darwin_arm64.tar.gz"
  sha256 "075c509a2a3b8c9a515b46b1e29d8524880faf9d9e391438b9f9a20ac0a60237"

  on_macos do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.4/mindslice-cli_darwin_amd64.tar.gz"
      sha256 "d1ddcafa5932952d2b110220abc95fa4da479fd0a110892e09f2b576a7f35d99"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.4/mindslice-cli_darwin_arm64.tar.gz"
      sha256 "075c509a2a3b8c9a515b46b1e29d8524880faf9d9e391438b9f9a20ac0a60237"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.4/mindslice-cli_linux_amd64.tar.gz"
      sha256 "6c00b0fd964885a79b2624c43307bc77b11403a98fbda48c3ae2bbb0425c9641"
    end
    on_arm do
      url "https://github.com/mindsliceai/mindslice-releases/releases/download/v0.2.4/mindslice-cli_linux_arm64.tar.gz"
      sha256 "531524c31e8ee3976d188b3c0d1efa0bb6e8dc16ef5cdc715f88c47bfa5ead9c"
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
