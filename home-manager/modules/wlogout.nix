{ config, lib, ... }: 
let
  inherit (config.lib.stylix.colors) base00 base01 base02 base03 base04 base05 base06 base07 base08 base09 base0A base0B base0C base0D base0E base0F;

  iconDir = ./../imgs/wlogout-icons;

  # Helper to generate home.file entries for each icon
  iconFiles = [
    "lock.png"
    "logout.png"
    "suspend.png"
    "hibernate.png"
    "shutdown.png"
    "reboot.png"
  ];
  iconConfig = lib.genAttrs iconFiles (name: {
    source = "${iconDir}/${name}";
    target = ".config/wlogout/icons/${name}";
  });

  stylixColors = ''
    * {
      font-family: "Fira Sans Semibold", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
      background-image: none;
      transition: 20ms;
      box-shadow: none;
    }

    window {
      background: url("${config.stylix.image}");
      background-size: cover;
      font-size: 16pt;
      color: #${base05};
    }

    button {
      background-repeat: no-repeat;
      background-position: center;
      background-size: 20%;
      background-color: rgba(200, 220, 255, 0);
      animation: gradient_f 20s ease-in infinite;
      border-radius: 80px;
      /* Increased border radius for a more rounded look */
      border: 0px;
    }

    button:focus {
      background-size: 22%;
      border: 0px;
    }

    button:hover {
      background-color: #${base0B};
      opacity: 0.8;
      color: #${base05};
      background-size: 30%;
      margin: 30px;
      border-radius: 80px;
      transition: all 0.3s cubic-bezier(.55, 0.0, .28, 1.682), box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      box-shadow: 0 0 50px #${base07};
    }

    /* Adjust the size of the icon or content inside the button */
    button span {
      font-size: 1.2em;
      /* Increase the font size */
    }

    /* 
    ----------------------------------------------------- 
    Buttons
    ----------------------------------------------------- 
    */

    #lock {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("icons/lock.png"));
    }

    #logout {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("icons/logout.png"));
    }

    #suspend {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("icons/suspend.png"));
    }

    #hibernate {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("icons/hibernate.png"));
    }

    #shutdown {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("icons/shutdown.png"));
    }

    #reboot {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("icons/reboot.png"));
    }
  '';

  layouts = [
    {
      label = "lock";
      action = "power lock";
      text = "Lock (l)";
      keybind = "l";
    }
    {
      label = "logout";
      action = "power exit";
      text = "Log Out (e)";
      keybind = "e";
    }
    {
      label = "suspend";
      action = "power suspend";
      text = "Suspend (u)";
      keybind = "u";
    }
    {
      label = "hibernate";
      action = "power hibernate";
      text = "Hibernate (h)";
      keybind = "h";
    }
    {
      label = "reboot";
      action = "power reboot";
      text = "Restart (r)";
      keybind = "r";
    }
    {
      label = "shutdown";
      action = "power shutdown";
      text = "Power Off (s)";
      keybind = "s";
    }
  ];
in {
  home.file = iconConfig;

  programs.wlogout = {
    enable = true;
    layout = layouts;
    style = stylixColors;
  };
}
