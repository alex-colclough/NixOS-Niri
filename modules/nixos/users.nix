{ pkgs, ... }: {
  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "changeme";
    packages = with pkgs; [
      tree
    ];
  };
}
