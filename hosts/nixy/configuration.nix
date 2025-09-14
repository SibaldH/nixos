{ pkgs, stateVersion, hostname, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../nixos/modules
    ];

  networking.hostName = hostname;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  system.stateVersion = stateVersion;
}

