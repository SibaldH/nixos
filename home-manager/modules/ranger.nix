{ pkgs, ... }: {
  programs.ranger = {
    enable = true;
    mappings = {
      e = "edit";

      ec = "compress";
      ex = "extract";

      b = "fzm";
    };

    settings = {
      preview_images = true;
      preview_images_method = "ueberzug";
      draw_borders = true;
      w3m_delay = 0;
    };

    extraConfig = ''
      default_linemode devicons2
    '';

    plugins = [
      {
        name = "ranger-archives";
        src = pkgs.fetchgit {
          url = "https://github.com/maximtrp/ranger-archives";
          rev = "b4e136b24fdca7670e0c6105fb496e5df356ef25";
	  sha256 = "1m67p742w1pld2pib61gqha4c373hqcclyby2cd0gdqqc0dvk6s0";
        };
      }
      {
        name = "ranger-devicons2";
        src = pkgs.fetchgit {
          url = "https://github.com/cdump/ranger-devicons2";
          rev = "94bdcc19218681debb252475fd9d11cfd274d9b1";
	  sha256 = "1j9343xrqizqg6mq6ws3gvv7dbfbkppkjnxr63ryk67k6yh8i438";
        };
      }
    ];
  };

  home.file.".config/ranger/commands.py".text = "from plugins.ranger_udisk_menu.mounter import mount";
}
