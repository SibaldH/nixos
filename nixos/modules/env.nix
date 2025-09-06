{user, ...}: {
	environment.sessionVariables = rec {
		TERMINAL = "alacritty";
		EDITOR = "nvim";
		XDG_BIN_HOME = "$HOME/.local/bin";
		PATH = [
			"${XDG_BIN_HOME}"
		];
		NH_FLAKE = "/home/${user}/nixos";
	};
}
