{ inputs, config, pkgs, lib, self, ...}:

{
	imports = [
	./programs/neovim.nix
	inputs.home-manager.nixosModules.home-manager
	];
	nix.settings.experimental-features = ["nix-command" "flakes"];

	home-manager = {
		extraSpecialArgs = { inherit inputs self; };
		users = {
		g0at = import ./home.nix;
		};
	};
}
