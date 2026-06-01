{ pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.permittedInsecurePackages = [
  #   "qtwebengine-5.15.19"
  # ];

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    imv
    mpv
    pavucontrol
    element-desktop
    librewolf
    freecad
    orca-slicer
    stremio-linux-shell
    spotify
    ferdium
    libreoffice
    onlyoffice-desktopeditors
    picard

    mixxx
    nicotine-plus
    qbittorrent

    # CLI utils
    android-tools
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
    ueberzugpp
    unzip
    usbutils
    appimage-run
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
