{ inputs, ... }: {

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  imports = [
    inputs.neovim-flake.homeManagerModules.default
  ];
}
