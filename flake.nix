{
  description = "g0at nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
		};

  };

  outputs = { self, nixpkgs, ... } @ inputs:
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
					specialArgs = {inherit inputs system;};

					modules = [./hosts/macbookpro/default.nix];
				};

			};

		};

}
