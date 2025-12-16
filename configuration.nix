# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, lib, pkgs, ... }:
let
  unstable = import <nixos-unstable> {
    config.allowUnfree = true;   # optional
  };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix ./gpusync.nix
    ];

  # Automatic updates
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";
  # Automatic cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = [ config.boot.kernelPackages.lenovo-legion-module ]; #Lenovo Legion

   # COMPLETELY DISABLE kwalletd system-wide
  systemd.user.services.kwalletd.enable = false;

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.iwd.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # ===== QUAD9 DNS CONFIGURATION - Choose ONE of the options below =====

  # Option 1: SIMPLEST - Just NetworkManager with Quad9 (Recommended)
    networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
    };

  # Force Quad9 DNS in NetworkManager
  networking.networkmanager.insertNameservers = [
    # IPv4 Quad9 servers
    "9.9.9.9"          # Primary IPv4 (Security + Malware blocking)
    "149.112.112.112"  # Secondary IPv4

    # IPv6 Quad9 servers
    "2620:fe::fe"      # Primary IPv6
    "2620:fe::9"       # Secondary IPv6
  ];

  # Also set system nameservers as backup
  networking.nameservers = [
    "9.9.9.9"
    "149.112.112.112"
    "2620:fe::fe"
    "2620:fe::9"
  ];

  # Disable systemd-resolved to avoid conflicts
  services.resolved.enable = false;

  #bluetooth

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  # Set your time zone.
  time.timeZone = "Asia/Dubai";

  # Select internationalisation properties.file, expecting ';'

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = false;
  services.desktopManager.plasma6.enable = true;

    # Auto-login on TTY1
  services.getty.autologinUser = "kalon";  # Replace with your username

    # Corrected version - simpler
  programs.bash.interactiveShellInit = ''
    if [[ $(tty) == /dev/tty1 ]]; then
        dbus-run-session startplasma-wayland
    fi
  '';

 environment.shellAliases = {
    killplasma = "pkill plasmashell";
    plasmakillall = "pkill -9 plasmashell; pkill -9 kwin_wayland; pkill -9 kded6; pkill -9 plasma_session";
    stopplasma = "pkill plasmashell && pkill kwin_wayland";

    startplasma = "dbus-run-session startplasma-wayland";
    restartplasma = "plasma-kill-all && sleep 2 && start-plasma";
    softrestartplasma = "kquitapp6 plasmashell && sleep 2 && kstart6 plasmashell";

    # TTY control
    tty1 = "sudo chvt 1";
    tty2 = "sudo chvt 2";
    tty3 = "sudo chvt 3";
    gui = "sudo chvt 1";
    term = "sudo chvt 2";

    # Logs
    logs-plasma = "journalctl -b --user -u plasma-* | tail -100";
    logs-boot = "journalctl -b | tail -100";

    # System
    update = "sudo nixos-rebuild switch";
    clean = "sudo nix-collect-garbage -d";
    rebuild = "sudo nixos-rebuild switch";
  };

  # Essential services for Wayland
  services.dbus.enable = true;
  security.polkit.enable = true;
  hardware.graphics.enable = true;


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.kalon = {
    isNormalUser = true;
    description = "kalon";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    htop #Task Monitor
    neofetch #System Fetch
    tree #Fancy way of showing directories
    piper #Logitech Mouse Hub
    libratbag #Piper Dependency
    protonup-qt #Proton-GE Installer
    inkscape #Vector design
    localsend #Airdrop
    vlc #Video Player
    telegram-desktop
    kdePackages.kdenlive #Video Editor
    tenacity #Audio Editor
    calibre #Ebook Reader
    brave
    unrar
    obs-studio
    obs-studio-plugins.obs-vkcapture
    krita
    #Unstable Packages
    unstable.harmonoid #Music Player
  ];

  fonts.packages = with pkgs;  [
    jetbrains-mono
    corefonts
    vista-fonts
  ];

  services.ratbagd.enable = true;

  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # optional
    dedicatedServer.openFirewall = true; # optional
    gamescopeSession.enable = true; # optional, for Gamescope
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  programs.localsend.enable = true;
  programs.localsend.openFirewall = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
