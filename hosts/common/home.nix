{ inputs, pkgs, ... }: {
  imports = [ 
		 inputs.nix-colors.homeManagerModules.default
		./programs/neovim/neovim.nix
		./programs/fish.nix
		./programs/git.nix
    ];
   
    home = {
    packages = with pkgs; [
			python3
			unzip
			cargo
			gcc
    ];

    username = "g0at";
    homeDirectory = "/home/g0at";
    stateVersion = "24.11";
  };
	
	nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
	programs.zoxide.enableFishIntegration= true;

	colorScheme = inputs.nix-colors.colorSchemes.dracula;


}
