{ pkgs, ... }: {
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "niri-session";
        user = "alex";
      };
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
        user = "greeter";
      };
    };
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri.overrideAttrs (oldAttrs: {
      doCheck = false;
    });
  };

  programs.dms-shell.enable = true;
  programs.xwayland.enable = true;
  programs.firefox.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
