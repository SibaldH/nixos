{ config, pkgs, inputs, lib, ... }:
let 
  system = pkgs.stdenv.hostPlatform.system;
in {
  programs.hyprland = {
    enable = true;
		withUWSM = true;
    xwayland.enable = true;
    package = (inputs.hyprland.packages.${system}.hyprland.overrideAttrs (final: prev: {
      buildInputs = (lib.lists.filter (e: e.pname != "aquamarine" || e.pname != "hyprutils") prev.buildInputs) ++ [
        (inputs.hyprland.inputs.aquamarine.packages.${system}.aquamarine.override {withMold = false;})
        (inputs.hyprland.inputs.hyprutils.packages.${system}.hyprutils.override {withMold = false;})
      ];
    })).override {withMold = false;}; 
    portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "jay";
  };
}
