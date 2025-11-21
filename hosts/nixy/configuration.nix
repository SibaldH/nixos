{ pkgs, stateVersion, hostname, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../nixos/modules
      ../../nixos/services
    ];

  networking.hostName = hostname;
  
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  system.stateVersion = stateVersion;
}

