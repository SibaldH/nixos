{ pkgs, config, lib, ... }: {
  options.services.games = {
    enable = lib.mkEnableOption "Enable game config";
  };

  config = lib.mkIf config.services.games.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = [ "amdgpu" ];

    environment.systemPackages = with pkgs; [
      mangohud
      lutris
    ];
  };
}
