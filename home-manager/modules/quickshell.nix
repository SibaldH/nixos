{ config, pkgs, ... }: let
  colors = config.lib.stylix.colors;
in {
  programs.quickshell = {
    enable = true;
    systemd.enable = true;

    configs.default = "${./quickshell/default}";
    activeConfig = "default";
  };
}
