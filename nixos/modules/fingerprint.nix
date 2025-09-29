{ config, pkgs, lib, ... }:
{
  options.services.fingerprint = {
    enable = lib.mkEnableOption "Enable fingerprint scanner support (Framework Laptop 13)";
  };

  config = lib.mkIf config.services.fingerprint.enable {
    services.fwupd.enable = true;
    services.fprintd.enable = true;

    security.pam.services = {
      login.fprintAuth = true;
      sudo.fprintAuth = true;
      polkit-1.fprintAuth = true;
    };
    systemd.services.fprintd = {
      wantedBy = [ "multi-user.target" ];
      serviceConfig.Type = "simple";
    };
    environment.systemPackages = with pkgs; [
      fprintd
    ];
  };
}
