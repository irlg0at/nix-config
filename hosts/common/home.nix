{ inputs, pkgs, ... }: {
  imports = [ 
		./programs/neovim/neovim.nix
		./programs/fish.nix
		./programs/git.nix
    ];
   
    home = {
    packages = with pkgs; [
    ];

    username = "g0at";
    homeDirectory = "/home/g0at";
    stateVersion = "24.11";
  };
	
	nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
	programs.zoxide.enableFishIntegration= true;

}
