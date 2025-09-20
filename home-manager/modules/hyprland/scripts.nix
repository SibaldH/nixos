{ config, pkgs, ... }:

let
  # Mapping of commands to their Nix store paths
  substitutions = {
    "#!/usr/bin/env bash" = "#!${pkgs.bash}/bin/bash";
    "pactl" = "${pkgs.pulseaudio}/bin/pactl";
    "notify-send" = "${pkgs.libnotify}/bin/notify-send";
    "brightnessctl" = "${pkgs.brightnessctl}/bin/brightnessctl";
    "bc" = "${pkgs.bc}/bin/bc";
    # Add more mappings as needed, e.g., "grim" = "${pkgs.grim}/bin/grim";
  };

  # Custom derivation for bundling multiple scripts
  hyprlandScripts = pkgs.stdenv.mkDerivation {
    name = "hyprland-scripts";
    src = ./scripts;  # Path to ./scripts/ dir with .sh files

    buildInputs = with pkgs; [
      bash
      pulseaudio    # For volume.sh
      libnotify     # For brightness.sh
      brightnessctl # For brightness.sh
      bc            # For brightness.sh
    ];

    installPhase = ''
      mkdir -p $out/bin
      for script in $src/*.sh; do
        name=$(basename "$script" .sh)
        install -m755 "$script" $out/bin/$name
        # Loop over substitutions map
        ${builtins.concatStringsSep "\n" (builtins.map (pattern: ''
          if grep -q ${pkgs.lib.escapeShellArg pattern} $out/bin/$name; then
            substituteInPlace $out/bin/$name \
              --replace ${pkgs.lib.escapeShellArg pattern} ${pkgs.lib.escapeShellArg (builtins.getAttr pattern substitutions)}
          fi
        '') (builtins.attrNames substitutions))}
      done
    '';
  };
in
{
  home.packages = with pkgs; [
    hyprlandScripts
  ];
}
