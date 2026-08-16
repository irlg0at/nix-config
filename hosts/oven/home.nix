{pkgs, ... }: {
  imports = [
		./../common/home.nix
		./../../modules/wm/niri/home.nix
		./../../modules/pentest/home.nix
    ];
	
    home = {
			packages = with pkgs; [
				slack
				vesktop
				beeper
				teams-for-linux
				insync
				libreoffice
			];
		};
}

