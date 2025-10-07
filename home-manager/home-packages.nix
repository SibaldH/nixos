{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    anki
    imv
    mpv
    pavucontrol
    element-desktop
    librewolf
    stremio
    spotify
    anytype
    logseq
    discord

    # CLI utils
    bc
    brightnessctl
    better-commits
    carapace
    cliphist
    dust
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
    udisks
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
