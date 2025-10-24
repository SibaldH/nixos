{ config, pkgs, ... }:

{
  # Enable GNOME keyring for secret storage (libsecret backend)
  services.gnome.gnome-keyring.enable = true;
}
