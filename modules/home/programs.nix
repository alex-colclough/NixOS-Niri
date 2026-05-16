{ ... }: {
  programs.nixvim = {
    enable = true;
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
    };
    bashrcExtra = ''
      if [ -f "$HOME/.secrets" ]; then
        source "$HOME/.secrets"
      fi
    '';
  };
}
