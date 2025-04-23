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
				flameshot
			];
		};
}

