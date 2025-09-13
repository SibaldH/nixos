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
    firefox

    # CLI utils
    bc
    brightnessctl
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
    mediainfo
    microfetch
    playerctl
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
