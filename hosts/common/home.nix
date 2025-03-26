{ inputs, pkgs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ];
   
    home = {
    packages = with pkgs; [
    ];

    username = "g0at";
    homeDirectory = "/home/g0at";
    stateVersion = "24.11";
  };

  programs.nixvim = {
    enable = true;
  };

  programs.home-manager.enable = true;
	programs.zoxide.enableFishIntegration= true;

}
