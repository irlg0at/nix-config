{config, ...}:
{
	services.dunst = {
		enable = true;
		settings = {
			global = {
				frame_color = "#${config.colorScheme.palette.base05}"; 
				seperate_color = "#${config.colorScheme.palette.base05}"; 
				#monitor = 1;
			};

			base16_low = {
				msg_urgency = "low";
				background = "#${config.colorScheme.palette.base00}"; 
				foreground = "#${config.colorScheme.palette.base03}"; 
			};
			
			base16_normal = {
				msg_urgency = "normal";
				background = "#${config.colorScheme.palette.base00}"; 
				foreground = "#${config.colorScheme.palette.base04}"; 
			};
			
			base16_critical = {
				msg_urgency = "critical";
				background = "#${config.colorScheme.palette.base00}"; 
				foreground = "#${config.colorScheme.palette.base08}"; 
			};

		};

	};
}
