{...}:
{
	programs.yambar = {
		enable = true;
		# Mostly fetched from https://codeberg.org/dnkl/yambar/src/branch/master/examples/configurations/laptop.conf
		config = {
			bar = {
				  location =  "top";
					height =  28;
					background = "282a36ff";
					margin = 10;
					spacing = 8;
					font = "Terminess Nerd Font Mono:style=Regular:pixelsize=22";
					};
			};
		};
}
