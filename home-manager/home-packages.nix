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
    wl-clipboard
    wtype
    yt-dlp
    zip

    # WM stuff
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Polkit
    polkit
    hyprpolkitagent

    # Other
    bemoji
    nix-prefetch-scripts
  ];
}
