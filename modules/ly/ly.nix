{pkgs, ...}:
{

	environment.systemPackages = [
		pkgs.ly
	];
	
	services.displayManager.ly.enable = true;
}


