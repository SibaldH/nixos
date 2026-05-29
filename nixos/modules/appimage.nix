{ config, pkgs, ... }: {
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.adb.enable = true;
}
