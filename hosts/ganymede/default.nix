{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/virtualization.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/packages.nix
    ../../modules/nixos/users.nix
  ];

  time.timeZone = "America/New_York";
  system.stateVersion = "26.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
}
