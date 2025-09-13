{ config, pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    uwsm
    rofi-wayland
    waybar
    wayland-utils
    dunst
    libnotify
    rofi-wayland
    wl-clipboard
    libsForQt5.xwaylandvideobridge
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    polkit
    hyprpolkitagent
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.xserver.enable = false;
}
