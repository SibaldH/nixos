{ pkgs, stateVersion, hostname, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../nixos/modules
    ];

  networking.hostName = hostname;

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.fingerprint.enable = true;
  services.games.enable = true;

  system.stateVersion = stateVersion;
}

