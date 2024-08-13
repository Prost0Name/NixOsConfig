{ config, lib, pkgs, ... }: {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/bundle.nix
      ./packages.nix
    ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Yekaterinburg";

  i18n.defaultLocale = "en_US.UTF-8";
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes

  users.users.prosto = {
     isNormalUser = true;
     extraGroups = [ "wheel" "input" "networkmanager"]; # Enable ‘sudo’ for the user.
   };

  system.stateVersion = "24.05";
}

