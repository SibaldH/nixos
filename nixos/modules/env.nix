{user, pkgs, ...}: {
	environment.sessionVariables = rec {
		TERMINAL = "alacritty";
		EDITOR = "nvim";
		PATH = [
			"${XDG_BIN_HOME}"
		];
		NH_FLAKE = "/home/${user}/nixos";
    NIXOS_OZONE_WL = "1";
		XDG_BIN_HOME = "$HOME/.local/bin";
    XDG_CONFIG_ROOT = "${pkgs.xorg.xkeyboardconfig}/share/X11/xkb";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_DATA_HOME = "$HOME/.local/share";
	};
}
