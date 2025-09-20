{ config, pkgs, ... }:

let
  hyprlandScripts = pkgs.stdenv.mkDerivation {
    name = "hyprland-scripts";
    src = ./scripts;

    buildInputs = with pkgs; [
      pulseaudio
      libnotify
      bash
    ];

    installPhase = ''
      mkdir -p $out/bin
      for script in $src/*.sh; do
        name=$(basename "$script" .sh)
        install -m755 "$script" $out/bin/$name
        substituteInPlace $out/bin/$name \
          --replace-fail '#!/usr/bin/env bash' '#!${pkgs.bash}/bin/bash' \
          --replace-fail 'pactl' '${pkgs.pulseaudio}/bin/pactl' \
          --replace-fail 'notify-send' '${pkgs.libnotify}/bin/notify-send'
          # Add more substitutions if other scripts need them
      done
    ''; 
  };
in {
  home.packages = with pkgs; [
    hyprlandScripts
  ];
}
