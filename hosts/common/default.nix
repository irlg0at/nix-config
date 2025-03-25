{ inputs, config, pkgs, lib, ...}:

{
	imports = [./programs/neovim.nix];
	nix.settings.experimental-features = ["nix-command" "flakes"];

	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			g0at = import ./home.nix;
		};
	};
}
