{ ... }: {
  # Deploy the Gruvbox theme so DMS can pick it up from its themes directory
  xdg.configFile."DankMaterialShell/themes/gruvbox/theme.json".source =
    ../../config/themes/gruvbox/theme.json;
}
