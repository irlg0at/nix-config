{
  description = "g0at nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
         url = "github:nix-community/nixvim";
         inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, ... } @ inputs:
		let 
			system = "x86_64-linux";
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
