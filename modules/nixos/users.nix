{ ... }:
{
  nix.settings.trusted-users = ["ozoku"];

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
}