{ config, pkgs, ... }: {
	home.username = "prosto";
	home.homeDirectory = "/home/prosto";
	home.stateVersion = "24.05";

	programs.fish = {
		enable = true;
		interactiveShellInit = "set fish_greeting";

		shellAliases =
		let
			flakeDir = "~/nix";
		in {
			rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
			hms = "home-manager switch --flake ${flakeDir}";
			conf = "nvim ${flakeDir}/nixos/configuration.nix";
			pkgs = "nvim ${flakeDir}/nixos/packages.nix";
		};
	};

	programs.fish.plugins = [
			{ name = "grc"; src = pkgs.fishPlugins.grc.src; }
	];

	programs.neovim = {
		enable = true;
		defaultEditor = true;

		viAlias = true;
  		vimAlias = true;
		vimdiffAlias = true;

		plugins = with pkgs.vimPlugins; [
  			nvchad
		];
	};
}
