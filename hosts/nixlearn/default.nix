{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core.nix
    ../../modules/nixos/users.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  networking = {
    hostName = "nixlearn";
    networkmanager.enable = true;
  };

  system.stateVersion = "23.05"; # Tätä ei muuteta ilman että on huolehtinut että kaikki toimii päivitysten jälkeen
}