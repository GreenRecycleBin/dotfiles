# Edit this configuration file to define what should be installed on your
# system. Help is available in the configuration.nix(5) man page and in the
# NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    extraModprobeConfig = ''
      # options resume=/dev/sda5
      options snd_hda_intel index=0 model=intel-mac-auto id=PCH
      options snd_hda_intel index=1 model=intel-mac-auto id=HDMI
      options snd-hda-intel model=mba6
    '';

    extraModulePackages = with pkgs.linuxPackages; [ mba6x_bl perf ];

    initrd.luks.devices = [
      {
        name = "rootfs";
        device = "/dev/sda4";
        preLVM = true;
      }
    ];

    kernelParams = [
      "hid_apple.fnmode=2"
      "hid_apple.iso_layout=0"
      "hid_apple.swap_opt_cmd=1"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      grub.device = "/dev/sda";
      # gummiboot.enable = true;
      systemd-boot.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    dmenu
    gnome3.networkmanagerapplet
    htop
    i3status
    kbdlight
    mbpfan
    pciutils
    powertop
    vim
    which
    xlibs.xbacklight
    xlibs.xev
  ];

  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [
      inconsolata
      dejavu_fonts
    ];
  };

  hardware.pulseaudio.enable = true;

  networking = {
    hostName = "page";
    networkmanager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  services = {
    acpid.enable = true;

    redshift = {
      enable = true;
      latitude = "1.3110600";
      longitude = "103.7669430";
    };

    xserver = {
      displayManager = {
        slim.enable = true;
        slim.defaultUser = "greenrecyclebin";
      };

      enable = true;

      synaptics = {
        enable = true;
        fingersMap = [ 1 3 2 ];
        horizontalScroll = true;
        palmDetect = true;
        tapButtons = true;
        twoFingerScroll = true;
        vertEdgeScroll = false;
        minSpeed = "0.6";
        maxSpeed = "60";
        accelFactor = "0.0075";
        additionalOptions = ''
          Option "FingerLow" "40"
          Option "FingerHigh" "60"
        '';
      };

      windowManager = {
        default = "i3";
        i3.enable = true;
      };

      xkbOptions = "ctrl:nocaps";
    };
  };

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  system.stateVersion = "16.03";

  time.timeZone = "Asia/Singapore";

  users.extraUsers.greenrecyclebin = {
    isNormalUser = true;
    name = "greenrecyclebin";
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # security.sudo.extraConfig = ''
  #   %wheel      ALL =NOPASSWD: /run/current-system/sw/bin/kbdlight
  # '';

  # networking.enableB43Firmware = true;
}
