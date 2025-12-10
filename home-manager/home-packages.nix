{ pkgs, inputs, system, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.file.".local/share/typst/packages/local/school-notes/0.1.0".source = inputs.school-notes;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    inputs.caelestia-cli.packages.${system}.default

    # Desktop apps
    imv
    mpv
    pavucontrol
    element-desktop
    librewolf
    # stremio
    spotify
    ferdium
    libreoffice

    mixxx
    nicotine-plus
    qbittorrent

    # CLI utils
    bc
    brightnessctl
    better-commits
    carapace
    cliphist
    dust
    disown
    ffmpeg
    ffmpegthumbnailer
    fzf
    lazygit
    grimblast
    htop
    hyprpicker
    imagemagick
    jq
    mediainfo
    microfetch
    playerctl
    pulseaudio
    ripgrep
    silicon
    sudo-rs
    typst
    ueberzugpp
    unzip
    w3m
    wget
    wtype
    yt-dlp
    zip

    # Other
    bemoji
    nix-prefetch-scripts
  ];
}
