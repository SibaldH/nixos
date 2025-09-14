{ config, pkgs, ... }:{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "be";
      kb_variant = "nodeadkeys";
      kb_options = "ctrl:nocaps,compose:rctrl";
      numlock_by_default = true;
      mouse_refocus = false;

      follow_mouse = 1;
      touchpad = {
        natural_scroll = true; 
      };
      sensitivity = 0;
    };
  };
}
