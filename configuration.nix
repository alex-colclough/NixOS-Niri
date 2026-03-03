
{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "ganymede";
    networking.networkmanager.enable = true;


    time.timeZone = "America/New_York";

    # Use greetd instead of getty for proper session management with Niri
    services.greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = "niri-session";
          user = "alex";
        };
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri-session";
          user = "greeter";
        };
      };
    };

    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    programs.niri = {
	enable = true;
	package = pkgs.niri.overrideAttrs (oldAttrs: {
	    doCheck = false;  # Skip tests that are failing
	});
    };
    programs.dms-shell.enable = true;
    programs.xwayland.enable = true;

    programs.steam = {
	enable = true;
    };

programs.gamemode.enable = true;


    xdg.portal = {
    	enable = true;
	wlr.enable = true;
	extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };

   users.users.alex = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable 'sudo' for the user.
     initialPassword = "changeme";
     packages = with pkgs; [
       tree
     ];
   };

    programs.firefox.enable = true;
  
environment.systemPackages = with pkgs; [
	vim
	wget
	kitty
	ghostty
	waybar
	git
	chromium
	fastfetch
	vesktop
	alacritty
	fuzzel
	xwayland-satellite
	thunar
	zed-editor
	quickshell
	swayidle
      ];
environment.sessionVariables.NIXOS_OZONE_WL = "1";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

 system.stateVersion = "25.11";

}

