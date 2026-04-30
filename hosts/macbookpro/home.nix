{pkgs, ... }: {
  imports = [
		./../common/home.nix
		./../../modules/wm/dwl/home.nix
		./../../modules/wm/niri/home.nix
		./../../modules/pentest/home.nix
    ./../../modules/music_processing.nix
    ./programs/durdraw.nix
    ];
	
    home = {
			packages = with pkgs; [
				slack
				vesktop
				beeper
        #teams-for-linux
				insync
				libreoffice
        vlc
        vmware-workstation
        kicad
        spotify
        claude-code
        pipx
			];
		};
}

