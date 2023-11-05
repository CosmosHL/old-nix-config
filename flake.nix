{
  description = "Sample Nix Config";

  # Ulostulot flakelle, tässä tapauksessa nixos konfiguraatiot eri järjestelmille
  outputs = {
    # Lähteet
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    nixosSystem = import ./lib/nixosSystem.nix;

    # nixlearn järjestelmän moduulit
    nixlearn-modules = {
      nixos-modules = [
        ./hosts/nixlearn
      ];
      home-module = import ./home/nixlearn.nix;
    };
  in {
    # NixOS konfiguraatiot
    # Näitä pystyy asentamaan `nixos-install --flake .#<järjestelmä>` komennolla
    # Ja päivittämään `nixos-rebuild switch --flake .` komennolla
    nixosConfigurations = let
      # yleiset argumentit
      base-args = {
        inherit home-manager;
        nixpkgs = nixpkgs;
        system = "x86_64-linux";
        specialArgs = inputs;
      };
    in {
      # Järjestelmät
      nixlearn = nixosSystem (nixlearn-modules // base-args);
    };
  };

  # Lähteet joista paketteja asennetaan
  inputs = {
    # NixOS:n stabiili versiojakelu
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    # Home Managerin jakelu
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Home Manager käyttämään NixOS:n versiojakelua
  };

  # Flake tiedoston nix konfiguraatio
  nixConfig = {
    # Sallitaan kehitteillä olevien ominaisuuksien käyttö
    experimental-features = ["nix-command" "flakes"];

    # Binääri pakettien "välimuisti"
    substituters = [
      "https://cache.nixos.org"
    ];
  };
}