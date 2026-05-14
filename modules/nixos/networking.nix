{ ... }: {
  networking.hostName = "ganymede";
  networking.networkmanager.enable = true;
  services.resolved.enable = true;
}
