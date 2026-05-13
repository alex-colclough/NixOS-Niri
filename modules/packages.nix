{ pkgs, ... }: {
   environment.systemPackages = with pkgs; [
      vim
      wget
      kitty
      ghostty
      git
      chromium
      fastfetch
      vesktop
      alacritty
      fuzzel
      xwayland-satellite
      thunar
      zed-editor
      nmap
      starship
  ];
}
