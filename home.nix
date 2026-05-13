{ config, pkgs, ...}:

{
	home.username = "alex";
	home.homeDirectory = "/home/alex";
	home.stateVersion = "26.05";
	
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

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use niri btw";
		};
		bashrcExtra = ''
			if [ -f "$HOME/.secrets" ]; then
				source "$HOME/.secrets"
			fi
		'';
           };
	   
        services.swayidle = {
	  enable = true;
	  timeouts = [
	    { 
	      timeout = 300; 
	      command = "niri msg action power-off-monitors";
	      resumeCommand = "niri msg action power-on-monitors";
	    }   
	  ];
	  extraArgs = [ "-w" "-d" ];
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
