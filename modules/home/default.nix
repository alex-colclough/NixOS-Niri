{ ... }: {
  imports = [
    ./programs.nix
    ./desktop.nix
  ];

  home.username = "alex";
  home.homeDirectory = "/home/alex";
  home.stateVersion = "26.05";
}
