{ config, pkgs, ...}:

{
	home.username = "alex";
	home.homeDirectory = "/home/alex";
	home.stateVersion = "25.11";
	
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	home.packages = with pkgs; [
	  bibata-cursors
	];

	home.pointerCursor = {
		gtk.enable = true;
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Classic";
		size = 20;
	};

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use niri btw";
		};
	};
}
