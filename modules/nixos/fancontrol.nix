{ pkgs, ... }: {
  boot.kernelModules = [ "nct6775" ];

  environment.systemPackages = with pkgs; [
    lm_sensors
  ];
}
