{pkgs, ...}:
{
	imports = [
		./programs/yambar/yambar.nix
		./programs/kitty.nix
		./programs/vivaldi.nix
		./programs/fuzzel.nix
	];
	
	fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
  	terminus-nerdfont
  ];
}
