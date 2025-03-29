{  pkgs, ... }: {
  imports = [ 
    ];
   
    home = {
    packages = with pkgs; [
			kitty
			fuzzel
			yambar
    ];
  };
}
