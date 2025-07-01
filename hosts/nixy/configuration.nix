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
  console = {
     font = "Lat2-Terminus16";
     keyMap = lib.mkDefault "be-latin1";
     useXkbConfig = true; # use xkb.options in tty.
  };
  
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  system.stateVersion = stateVersion;
}

