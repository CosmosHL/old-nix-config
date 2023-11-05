{ config, pkgs, ... }:
{
  imports = [../hardware-configuration.nix];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  networking = {
    hostName = "nixlearn";
    networkmanager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
    trusted-users = ["ozoku"];
  };

  time.timeZone = "Europe/Helsinki";
  console.keyMap = "fi";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = false;
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
    curl
    wget
    git
  ];

  environment.variables.EDITOR = "nvim";

  users.groups.ozoku = {};

  users.users.ozoku = {
    hashedPassword = "$6$lB2jF8mLXdtiPM9f$xzNVROokhZBQhB6Yfi0WS27wJHaBM2ETRx0YlzXi5yAkRX8EBEborg1rzcdSin3PFoWyHpuyMuWCHaedR/vc11";
    home = "/home/ozoku";
    isNormalUser = true;
    extraGroups = [
      "ozoku"
      "users"
      "networkmanager"
      "wheel"
    ];
  };

  system.stateVersion = "23.05"; # Tätä ei muuteta ilman että on huolehtinut että kaikki toimii päivitysten jälkeen
}