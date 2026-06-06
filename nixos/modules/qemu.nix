{ config, user, pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      package = pkgs.qemu_kvm;

      # Needed for Windows 11 TPM 2.0 support
      swtpm.enable = true;
    };
  };

  programs.virt-manager.enable = true;

  # Replace with your actual NixOS username
  users.users.${user}.extraGroups = [ "libvirtd" ];

  # Useful for USB passthrough/redirection in virt-manager
  virtualisation.spiceUSBRedirection.enable = true;

  # Helpful for libvirt's default NAT network
  environment.systemPackages = with pkgs; [
    dnsmasq
    virtio-win
    win-spice
  ];

  # Optional, if your firewall blocks the default libvirt bridge
  networking.firewall.trustedInterfaces = [ "virbr0" ];
}
