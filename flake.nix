{
  description = "Sample Nix Config";

  outputs = {
    nixpkgs,
    ...
  } @ inputs: let
    username = "ozoku";
  in {
    nixosConfigurations = {
      nixlearn = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixlearn.nix
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  nixConfig = {
    experimental-features = ["nix-command" "flakes"];

    substituters = [
      "https://cache.nixos.org"
    ];
  };
}