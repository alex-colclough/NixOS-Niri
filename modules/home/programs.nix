{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      set number relativenumber
    '';
    plugins = [
      pkgs.vimPlugins.LazyVim
    ];
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
}
