{ inputs,  self, ...}:

{
	imports = [
	./programs/neovim/neovim.nix
	./programs/fish.nix
	inputs.home-manager.nixosModules.home-manager
	];

	nix.settings.experimental-features = ["nix-command" "flakes"];

	home-manager = {
		extraSpecialArgs = { inherit inputs self; };
		users = {
		g0at = import ./home.nix;
		};
	};

 	programs.fish.enable = true;

}
