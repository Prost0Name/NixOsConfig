{ pkgs, ... }: {
  programs.fish.enable = true;

  users = {
    defaultUserShell = pkgs.fish;

    users.prosto = {
      isNormalUser = true;
      description = "prosto";
      extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" ];
      packages = with pkgs; [];
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "prosto";
}
