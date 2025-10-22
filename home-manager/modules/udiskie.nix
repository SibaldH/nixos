{pkgs, ...}: { 
    services.udiskie = {
    enable = true;
    settings.program_options = {
      file_manager = "${pkgs.ranger}/bin/ranger";
      tray = "auto";
      menu = "nested";
      notify_command = "notify-send --urgency=normal -t 10000 -a DISKIE '{event}: {device_presentation}'";
    };
  };
}
