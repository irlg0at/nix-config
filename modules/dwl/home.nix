{inputs, pkgs, ...}:
{
	imports = [
		 inputs.nix-colors.homeManagerModules.default
		./programs/yambar/yambar.nix
		./programs/kitty.nix
		./programs/vivaldi.nix
		./programs/fuzzel.nix
		./programs/kanshi.nix
		./programs/ranger.nix
		./programs/dunst.nix
	];
	colorScheme = inputs.nix-colors.colorSchemes.dracula;
	fonts.fontconfig.enable = true;
 	
  home.packages = with pkgs; [
  	nerd-fonts.terminess-ttf	
		wmname
		swww
		brightnessctl
		dconf
		wlr-randr
		(flameshot.override { enableWlrSupport = true; })
		spotify-player
  ];

	gtk = {
		enable = true;
		iconTheme = {
			name = "Dracula";
			package = pkgs.dracula-theme;
		};

		theme = {
			package = pkgs.dracula-theme;
			name = "Dracula";
		};
		
		cursorTheme = {
			name = "Simp1e-Dark";
			package = pkgs.simp1e-cursors;
		};
	};

	qt = {
		enable = true;
		platformTheme.name = "gtk";
		style.name = "Dracula";
		style.package = pkgs.dracula-qt5-theme;



	};
}
