{
  description = "Niri on NixOS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = { nixpkgs, home-manager, niri, nixvim, ... }:
  let
    sharedModules = system: homeModule: [
      niri.nixosModules.niri
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.alex = import homeModule;
          backupFileExtension = "backup";
          extraSpecialArgs = { inherit nixvim; };
          sharedModules = [ nixvim.homeModules.nixvim ];
        };
      }
    ];
  in {
    nixosConfigurations.ganymede = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hosts/ganymede ] ++ sharedModules "x86_64-linux" ./modules/home;
    };

    nixosConfigurations.phobos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hosts/phobos ] ++ sharedModules "x86_64-linux" ./modules/home/phobos.nix;
    };
  };
}
