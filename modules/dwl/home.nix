{pkgs, ...}:
{
	imports = [
		./programs/yambar/yambar.nix
		./programs/kitty.nix
		./programs/vivaldi.nix
		./programs/fuzzel.nix
		./programs/kanshi.nix
	];
	
	fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
  	nerd-fonts.terminess-ttf	
		wmname
		swww
		brightnessctl
		dconf
		wlr-randr
		(flameshot.override { enableWlrSupport = true; })
  ];

	gtk = {
		enable = true;
		iconTheme = {
			name = "Dracula";
			package = pkgs.dracula-theme;
		};
	};
}
