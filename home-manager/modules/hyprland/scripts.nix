{ config, pkgs, ... }:

let
  # Custom derivation for bundling multiple scripts
  hyprlandScripts = pkgs.stdenv.mkDerivation {
    name = "hyprland-scripts";
    src = ./scripts;  # Path to ./scripts/ dir with .sh files

    buildInputs = with pkgs; [ pulseaudio libnotify bash ];

    installPhase = ''
      mkdir -p $out/bin
      for script in $src/*.sh; do
        name=$(basename "$script" .sh)
        install -m755 "$script" $out/bin/$name
        # Only substitute if pattern exists to avoid errors
        if grep -q '#!/usr/bin/env bash' $out/bin/$name; then
          substituteInPlace $out/bin/$name \
            --replace '#!/usr/bin/env bash' '#!${pkgs.bash}/bin/bash'
        fi
        if grep -q 'pactl' $out/bin/$name; then
          substituteInPlace $out/bin/$name \
            --replace 'pactl' '${pkgs.pulseaudio}/bin/pactl'
        fi
        if grep -q 'notify-send' $out/bin/$name; then
          substituteInPlace $out/bin/$name \
            --replace 'notify-send' '${pkgs.libnotify}/bin/notify-send'
        fi
        # Add more conditional substitutions for other commands as needed
      done
    '';
  };
in
{
  home.packages = with pkgs; [
    hyprlandScripts
  ];
}
