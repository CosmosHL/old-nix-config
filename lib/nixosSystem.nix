{
  nixpkgs,
  home-manager,
  system,
  specialArgs,
  nixos-modules,
  home-module,
}:
  nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules =
      # Järjestelmäkohtaiset moduulit
      nixos-modules
      ++ [
        # Nix komentoihin liittyvää
        {
          # `nix run nixpkgs#nixpkgs` käyttämään samoja paketti versioita kuin itse järjestelmä
          nix.registry.nixpkgs.flake = nixpkgs;

          # `nix repl '<nixpkgs>'` käyttämään samoja paketti versioita kuin itse järjestelmä
          environment.etc."nix/inputs/nixpkgs".source = "${nixpkgs}";
          nix.nixPath = ["/etc/nix/inputs"];
        }

        # Home Managerin käyttöönotto
        home-manager.nixosModules.home-manager
        {
          # Käytä itse valittua NixOS pakettiversiota Home Managerin hallinnoiman version sijasta
          # Tämä lisää johdonmukaisuutta ja nopeuttaa järjestelmän päivittämistä
          home-manager.useGlobalPkgs = true;
          # Asenna paketit järjestelmätasolla
          home-manager.useUserPackages = true;
          # Käyttäjäprofiilin hallintamoduuli
          home-manager.users.ozoku = home-module;
        }
      ];
  }