{
  wayland.windowManager.hyprland.settings = {
    binds = {
      "$mainMod" = "SUPER";
      bind = [
        # Applications
        "$mainMod, RETURN, exec, uwsm app -- alacritty"
        "$mainMod, B, exec, uwsm app -- librewolf"

        # Windows
        "$mainMod, Q, killactive"
        "$mainMod, F, fullscreen"
        "$mainMod, T, togglefloating"
        "$mainMod, P, togglesplit"
        "$mainMod, O, swapsplit"

        # Actions
        "$mainMod SHIFT, Q, exec, uwsm app -- hyprlock"

        # Move focus with vim keys
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # Move active window with SHIFT + vim keys
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        # Resize active window with CTRL + vim keys
        "$mainMod CTRL, h, resizeactive, -10 0" 
        "$mainMod CTRL, l, resizeactive, 10 0" 
        "$mainMod CTRL, k, resizeactive, 0 -10"
        "$mainMod CTRL, j, resizeactive, 0 10" 

        # Fn keys
        ", XF86AudioRaiseVolume, exec, uwsm app -- volume inc"
        ", XF86AudioLowerVolume, exec, uwsm app -- volume dec"
        ", XF86AudioMute, exec, uwsm app -- volume mute"
        ", XF86AudioPlay, exec, uwsm app -- playerctl play-pause"
        ", XF86AudioPause, exec, uwsm app -- playerctl pause"
        ", XF86AudioNext, exec, uwsm app -- playerctl next"
        ", XF86AudioPrev, exec, uwsm app -- playerctl previous"

        # Printscreen
        ", Print, exec, screenshot area"
        "$mainMod, Print, exec, screenshot window"
        "$mainMod SHIFT, Print, exec, screenshot monitor"
      ] ++ (
        # Workspaces: binds $mod + [shift +] {number row keys 1-0} to [move to] workspace {1-10}
        # Keys: code:10 (&/1), 11 (é/2), 12 ("/3), 13 ('/4), 14 ((/5), 15 (§/6), 16 (è/7), 17 (!/8), 18 (ç/9), 19 (à/0)
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mainMod, code:${toString (10 + i)}, workspace, ${toString ws}"
            "$mainMod SHIFT, code:${toString (10 + i)}, movetoworkspace, ${toString ws}"
          ]
        ) 10)
      );
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
