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
    config.common = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
      "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.pcscd.enable = true;

  security.pki.certificateFiles = [ ../../hosts/ganymede/Certificates_PKCS7_v5_14_DoD/DoD_PKE_CA_chain.pem ];

}
