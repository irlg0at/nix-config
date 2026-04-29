{ config, pkgs, ...}:
{
	imports = [
    ../../nix-colors.nix
		./programs/kitty.nix
		./programs/waybar.nix
		./programs/vivaldi/vivaldi.nix
		./programs/fuzzel.nix
		./programs/kanshi.nix
		./programs/ranger.nix
		./programs/dunst.nix
		./programs/zathura.nix
    ../wm.nix
	];
	fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
  	nerd-fonts.terminess-ttf	
		wmname
		swww
		brightnessctl
		dconf
		wlr-randr
		spotify-player
		tomato-c
    # Trio for taking screenshots
    grim
    swappy
    slurp
    # VPN
    networkmanagerapplet
    openconnect
  ];
}
