{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix # Laitteiston kokoonpanon tiedot
    ../../modules/nixos/core.nix # Yleiset asetukset
    ../../modules/nixos/users.nix # Käyttäjätilit
  ];

  # EFI Käynnistyslataajan asetukset
  boot.loader = {
    # Saa muokata EFI muuttujia (käynnistysvaihtoehtojen lisäys UEFI:in)
    efi.canTouchEfiVariables = true;
    # Valittu käynnistyslataaja
    systemd-boot.enable = true;
  };

  networking = {
    hostName = "nixlearn"; # Järjestelmän nimi
    networkmanager.enable = true; # Käytä NetworkManageria netin hallintaan
  };

  system.stateVersion = "23.05"; # Tätä ei muuteta ilman että on huolehtinut että kaikki toimii päivitysten jälkeen
}