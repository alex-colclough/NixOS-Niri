{ config, pkgs, ...}:

{
	home.username = "alex";
	home.homeDirectory = "/home/alex";
	home.stateVersion = "25.11";
	
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use niri btw";
		};
		profileExtra = ''
			if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
				 niri-session
			fi
		'';
	};
        home.file.".config/waybar" .source = ./config/waybar;

	home.packages = [ pkgs.bibata-cursors ];
	home.pointerCursor = {
		gtk.enable = true;
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Classic";
		size = 20;
	};





}


