{  pkgs, ...}:
{
	imports = [
    ../../nix-colors.nix
		../_programs/kitty.nix
		../_programs/waybar.nix
		../_programs/vivaldi/vivaldi.nix
		../_programs/fuzzel.nix
		../_programs/kanshi.nix
		../_programs/ranger.nix
		../_programs/dunst.nix
		../_programs/zathura.nix
	];
	fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
  	nerd-fonts.terminess-ttf	
		wmname
		awww
		brightnessctl
		dconf
		wlr-randr
		spotify-player
		tomato-c
    # VPN
    networkmanagerapplet
    openconnect
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;


}
