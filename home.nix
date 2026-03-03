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

	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		extraConfig = ''
			set number relativenumber
		'';
	};

	programs.neovim.plugins = [
		pkgs.vimPlugins.LazyVim
		];


	home.pointerCursor = {
		gtk.enable = true;
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Classic";
		size = 20;
	};
	programs.yazi.enable = true;

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use niri btw";
		};

           };

	xdg.portal = {
	  	enable = true;
		extraPortals = with pkgs; [
			xdg-desktop-portal-gtk
			xdg-desktop-portal-wlr
		];
		config.common.default = "*";
	};
}
