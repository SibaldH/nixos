{ config, pkgs, ... }:
let
  colors = config.lib.stylix.colors;
in {
  programs.waybar.settings.mainBar = with colors; {
    position = "top";
    layer = "top";
    height = 36;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      "hyprland/workspaces"
      "tray"
      "hyprland/window"
    ];
    modules-center = [ "clock" ];
    modules-right = [
      "pulseaudio"
      "network"
      "battery"
    ];
    clock = {
      calendar = {
        format = {
          today = "<span color='#${base0B}'><b>{}</b></span>";
        };
      };
      format = "  {:%H:%M}";
      tooltip = "true";
      tooltip-format = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = "  {:%d/%m}";
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        "urgent"= "";
        "active"= "";
        "visible"= "";
        "default"= "";
        "empty"= "";
        sort-by-number = true;
      };
    };
    "hyprland/window" = {
      format = "<span font='11'>{initialClass}</span>";
      icon = true;
    };
    network = {
      format-wifi = "<span foreground='#${base0E}'> </span> {signalStrength}%";
      format-ethernet = "<span foreground='#${base0E}'>󰀂 </span>";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "<span foreground='#${base0E}'>󰖪 </span>";
      on-click = "${pkgs.alacritty}/bin/alacritty -e ${pkgs.networkmanager}/bin/nmtui";
    };
    tray = {
      icon-size = 20;
      spacing = 8;
    };
    pulseaudio = {
      format = "{icon}  {volume}%";
      format-muted = "<span foreground='#${base0D}'> </span> {volume}%";
      format-icons = {
        default = [ "<span foreground='#${base0D}'> </span>" ];
      };
      scroll-step = 2;
      on-click = "pavucontrol";
      on-click-right = "volume mute";
    };
    battery = {
      format = "<span foreground='#${base0A}'>{icon}</span> {capacity}%";
      format-icons = [
        " "
        " "
        " "
        " "
        " "
      ];
      format-charging = "<span foreground='#${base0A}'> </span>{capacity}%";
      format-full = "<span foreground='#${base0A}'> </span>{capacity}%";
      format-warning = "<span foreground='#${base0A}'> </span>{capacity}%";
      interval = 5;
      states = {
        warning = 20;
      };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
    };
    "hyprland/language" = {
      format = "<span foreground='#${base0A}'> </span> {}";
      format-fr = "FR";
      format-en = "US";
    };
  };
}
