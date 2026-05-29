{
  services.udev.extraRules = ''
    # Mudita Kompakt / Mudita USB access
    SUBSYSTEM=="tty", ATTRS{idVendor}=="3310", GROUP="dialout", MODE="0666"
    SUBSYSTEM=="usb", ATTR{idVendor}=="3310", MODE="0666"
  '';
}
