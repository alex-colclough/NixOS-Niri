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
	     };

	     outputs = { nixpkgs, home-manager, niri, ... }: {
		nixosConfigurations.hyprland-btw = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				niri.nixosModules.niri
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.alex = import ./home.nix;
						backupFileExtension = "backup";
					};
				}
				# Allow unfree packages
				{ nixpkgs.config.allowUnfree = true; }
		];
	};
    };
}
