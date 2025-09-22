{ config, ... }:
let
  colors = config.lib.stylix.colors;
  font = config.stylix.fonts.sansSerif.name;
in
{
  programs.waybar.style = with colors; ''
    * {
      border: none;
      border-radius: 0px;
      padding: 0;
      margin: 0;
      font-family: "${font}";
      font-weight: bold;
      opacity: 1;
      font-size: 18px;
    }

    window#waybar {
      background: #282828;
      border-top: 1px solid #${base03};
    }

    tooltip {
      background: #${base01};
      border: 1px solid #${base03};
    }
    tooltip label {
      margin: 5px;
      color: #${base07};
    }

    #workspaces {
      padding-left: 15px;
    }
    #workspaces button {
      color: #${base0A};
      padding-left:  5px;
      padding-right: 5px;
      margin-right: 10px;
    }
    #workspaces button.empty {
      color: #${base07};
    }
    #workspaces button.active {
      color: #${base09};
    }

    #clock {
      color: #${base07};
    }

    #tray {
      margin-left: 10px;
      color: #${base07};
    }
    #tray menu {
      background: #${base01};
      border: 1px solid #${base03};
      padding: 8px;
    }
    #tray menuitem {
      padding: 1px;
    }

    #pulseaudio, #network, #cpu, #memory, #disk, #battery, #language, #custom-notification {
      padding-left: 5px;
      padding-right: 5px;
      margin-right: 10px;
      color: #${base07};
    }

    #pulseaudio, #language {
      margin-left: 15px;
    }

    #custom-notification {
      margin-left: 15px;
      padding-right: 2px;
      margin-right: 5px;
    }

    #custom-launcher {
      font-size: 20px;
      color: #${base07};
      font-weight: bold;
      margin-left: 15px;
      padding-right: 10px;
    }
  '';
}
