{ config, pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [rofi-calc rofi-emoji-wayland];
    modes = [ "drun" "run" "window" "emoji" "calc" "keys"];
  };
}
