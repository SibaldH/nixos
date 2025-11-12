{ config, pkgs, inputs, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.uwsm.enable = true;

  environment.systemPackages = with pkgs; [
    uwsm
    waybar
    wayland-utils
    dunst
    libnotify
    wl-clipboard
    libsForQt5.xwaylandvideobridge
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    polkit
    hyprpolkitagent
    evtest
    kitty
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
