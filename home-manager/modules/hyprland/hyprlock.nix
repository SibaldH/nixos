{ config, pkgs, user, ... }:
let
  colors = config.lib.stylix.colors;
  mkColor = c: "rgb(${c})";
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        ignore_empty_input = true;
      };

      background = [
        {
          monitor = "";
          path = "${config.stylix.image}";
          blur_passes = 3;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "200, 50";
          outline_thickness = 3;
          dots_size = 0.33; # Scale of input-field height
          dots_spacing = 0.15; # Scale of dots' absolute size
          dots_center = true;
          dots_rounding = -1; # Circle
          outer_color = mkColor colors.base03;
          inner_color = mkColor colors.base07;
          font_color = mkColor colors.base00;
          fade_on_empty = true;
          fade_timeout = 1000; # Milliseconds
          placeholder_text = "<i>Input Password...</i>";
          hide_input = false;
          rounding = -1; # Circle
          check_color = mkColor colors.base0A;
          fail_color = mkColor colors.base08;
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          fail_transition = 300; # ms
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1;
          invert_numlock = false;
          swap_font_color = false;
          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        { # Clock
          monitor = "";
          text = "cmd[update:1000] echo \"$TIME\""; # Clock
          color = mkColor colors.base05;
          font_size = 55;
          font_family = "${config.stylix.fonts.sansSerif.name}";
          position = "-100, 70";
          halign = "right";
          valign = "bottom";
          shadow_passes = 5;
          shadow_size = 10;
        }
        { # User
          monitor = "";
          text = "${user}";
          color = mkColor colors.base05;
          font_size = 20;
          font_family = "${config.stylix.fonts.sansSerif.name}";
          position = "-100, 160";
          halign = "right";
          valign = "bottom";
          shadow_passes = 5;
          shadow_size = 10;
        }
      ];

      image = [
        {
          monitor = "";
          path = "${config.stylix.image}";
          size = 280; # Lesser side if not 1:1
          rounding = -1; # Circle
          border_size = 4;
          border_color = mkColor colors.base06;
          rotate = 0; # Degrees, counter-clockwise
          reload_time = -1; # No reload
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
