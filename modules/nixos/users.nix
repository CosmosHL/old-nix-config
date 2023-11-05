{ ... }:
{
  # Luotetut Nix käyttäjät
  nix.settings.trusted-users = ["ozoku"];

  # Ryhmä käyttäjälle
  users.groups.ozoku = {};

  # Käyttäjätili
  users.users.ozoku = {
    # Pilkottu salasana
    hashedPassword = "$6$lB2jF8mLXdtiPM9f$xzNVROokhZBQhB6Yfi0WS27wJHaBM2ETRx0YlzXi5yAkRX8EBEborg1rzcdSin3PFoWyHpuyMuWCHaedR/vc11";
    # Kotikansio
    home = "/home/ozoku";
    # Oikea käyttäjä, ei järjestelmän palvelu käyttäjätili
    isNormalUser = true;
    # Lisä ryhmät NetworkManageria ja sudo oikeuksia varten
    extraGroups = [
      "ozoku"
      "users"
      "networkmanager"
      "wheel"
    ];
  };
}