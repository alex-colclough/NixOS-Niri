{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    nixpkgs.source = pkgs.path;
    viAlias = true;
    vimAlias = true;
    extraConfigVim = ''
      set number relativenumber
    '';
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use niri btw";
      nixos = "sudo nixos-rebuild switch --flake .#ganymede";
      ls = "lsd";
    };
    bashrcExtra = ''
      if [ -f "$HOME/.secrets" ]; then
        source "$HOME/.secrets"
      fi
    '';
  };
}
