{
	description = "My System config";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		stylix = {
			url = "github:nix-community/stylix/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    hyprland.url = "github:hyprwm/Hyprland";

    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };

    neovim-flake = {
      url = "github:sibaldh/nvim-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    school-notes = {
      url = "git+ssh://git@github.com/sibaldh/school-notes.git";
      flake = false;  # This is a non-flake repository (just files)
    };

    caelestia-cli = {
      url = "github:caelestia-dots/cli";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
	};

	outputs = { self, nixpkgs, home-manager, neovim-flake, hyprland, ...}@inputs: let
			system = "x86_64-linux";
			homeStateVersion = "25.11";
			user = "jay";
			hosts = [
				{ hostname = "nixy"; stateVersion = "25.11"; }
				{ hostname = "dustyslut"; stateVersion = "25.11"; }
				{ hostname = "frame"; stateVersion = "25.11"; }
			];

			makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
				system = system;
				specialArgs = {
					inherit inputs stateVersion hostname user;
				};

				modules = [
          inputs.stylix.nixosModules.stylix
					./hosts/${hostname}/configuration.nix
				];
			};
			
  in {
    nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      configs // {
        "${host.hostname}" = makeSystem {
          inherit (host) hostname stateVersion;
        };
      }) {} hosts;
    
    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit inputs homeStateVersion user system;
      };

      modules = [
        ./home-manager/home.nix
      ];
    };
	};
}
