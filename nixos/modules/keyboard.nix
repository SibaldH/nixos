{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    xorg.xkeyboardconfig
  ];

  console = {
    font = pkgs.nerd-fonts.jetbrains-mono;
    keyMap = "be-latin1";
    useXkbConfig = false; # use xkb.options in tty.
  };

  # services.xserver = {
  #   enable = true;
  #   xkb = {
  #     layout = "be";
  #     variant = "latin1";
  #   };
  # };
}
