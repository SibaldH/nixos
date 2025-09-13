{user, ...}: {
	environment.sessionVariables = rec {
		TERMINAL = "alacritty";
		EDITOR = "nvim";
		XDG_BIN_HOME = "$HOME/.local/bin";
		PATH = [
			"${XDG_BIN_HOME}"
		];
		NH_FLAKE = "/home/${user}/nixos";
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
	};
}
