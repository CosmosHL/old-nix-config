{ ... }:
{
  imports = [];

  home = {
    username = "ozoku";
    homeDirectory = "/home/ozoku";

    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}