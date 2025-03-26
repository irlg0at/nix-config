{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
		./../common/home.nix
    ];
}

