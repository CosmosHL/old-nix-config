{ pkgs, ... }:
{
  imports = [];

  home = {
    username = "ozoku";
    homeDirectory = "/home/ozoku";

    # Käyttäjäkohtaiset paketit
    packages = with pkgs; [
      neofetch
    ];

    stateVersion = "23.05";
  };

  # Anna Home Managerin hallita itseään
  programs.home-manager.enable = true;
}