{ config, pkgs, ... }: {
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # Avoid multiple instances
        before_sleep_cmd = "loginctl lock-session"; # Lock before suspend
        after_sleep_cmd = "hyprctl dispatch dpms on"; # Re-enable display
        ignore_dbus_inhibit = false; # Respect DBus inhibit signals
      };

      listener = [
        {
          timeout = 600; # 10 min
          on-timeout = "loginctl lock-session"; # Trigger lock
        }
        {
          timeout = 660; # 11 min
          on-timeout = "hyprctl dispatch dpms off"; # Screen off
          on-resume = "hyprctl dispatch dpms on"; # Screen on
        }
        {
          timeout = 1800; # 30 min
          on-timeout = "systemctl suspend"; # Suspend system
        }
      ];
    };
  };
}
