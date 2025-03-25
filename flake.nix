{
  description = "g0at nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
		let 
			system = "x86_64-linux";

			pkgs = import nixpkgs {
				inherit system;

				config = {
					allowUnfree = true;
				};
			};
		in
		{
			nixosConfigurations = {
				macbookpro = nixpkgs.lib.nixosSystem {
					specialArgs = {inherit system;};

					modules = [./hosts/macbookpro/default.nix];
				};

			};

		};

}
