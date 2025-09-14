{ pkgs, config, inputs, ...}:{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
    fontDir.enable = true;

    enableGhostscriptFonts = true;
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";

    targets.console.enable = true;
  };
}
