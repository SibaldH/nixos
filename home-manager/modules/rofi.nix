{ config, pkgs, ...}: {
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [rofi-calc rofi-emoji];
    modes = [ "drun" "run" "window" "emoji" "calc" "keys"];
  };
}
