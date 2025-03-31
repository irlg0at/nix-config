{ inputs,  self, ...}:

{
	imports = [
	inputs.home-manager.nixosModules.home-manager
	];

	home-manager = {
		extraSpecialArgs = { inherit inputs self; };
		users = {
		g0at = import ./home.nix;
		};
	};


	nix.settings.experimental-features = ["nix-command" "flakes"];
 	programs.fish.enable = true;
	nixpkgs.config.allowUnfree = true;

}
