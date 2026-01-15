{pkgs, ... }: {
  imports = [
		./../common/home.nix
		./../../modules/dwl/home.nix
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
        vlc
        vmware-workstation
			];
		};
}

