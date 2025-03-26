{ inputs, pkgs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
		./programs/neovim/neovim.nix
		./programs/fish.nix
    ];
   
    home = {
    packages = with pkgs; [
    ];

    username = "g0at";
    homeDirectory = "/home/g0at";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
	programs.zoxide.enableFishIntegration= true;

}
