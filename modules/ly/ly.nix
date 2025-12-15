{ config, pkgs, ...}:
{
  imports = [
    ../nix-colors.nix
  ];
	environment.systemPackages = [
		pkgs.ly
	];
	
	services.displayManager.ly = {
		enable = true;

		settings = {
			vi_mode = true;
			waylandsessions = "/etc/ly/sessions/";
      animation = "colormix";
      colormix_col1 = "0x${config.colorScheme.palette.base00}";
      colormix_col2 = "0x${config.colorScheme.palette.base05}";
      colormix_col3 = "0x${config.colorScheme.palette.base09}";
		};

	};
}


