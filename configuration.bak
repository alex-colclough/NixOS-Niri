
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

    services.getty.autologinUser = "alex";

    programs.niri = {
	enable = true;
    };

    # XWayland support (optional, but recommended)
    programs.xwayland.enable = true;

    programs.steam = {
	enable = true;
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
	rofi
      ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

 system.stateVersion = "25.11";

}

