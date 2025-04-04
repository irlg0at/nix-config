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
  	nerd-fonts.terminess-ttf	
		wmname
		swww
		brightnessctl
		waylock
		dconf
		wlr-randr
  ];

	gtk = {
		enable = true;
		iconTheme = {
			name = "Dracula";
			package = pkgs.dracula-theme;
		};
	};
}
