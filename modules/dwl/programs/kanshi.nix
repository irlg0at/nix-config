{...}:
{
	services.kanshi = {
		enable = true;	
		settings = [
			{
				profile.name = "oven";
				profile.exec = ["pkill yambar;yambar"];
				profile.outputs = 	[
					{
						criteria = "Samsung Electric Company LC34G55T H4ZT903472";
						position = "1080,0";
						mode = "3440x1440@165Hz";
					}
					{
						criteria = "BNQ BenQ XL2411Z S9F04040SL0";
						position = "0,0";
						mode = "1920x1080@60Hz";
						transform = "90";
					}
				];
			}
			{
				profile.name = "oven - one screen";
				profile.exec = ["pkill yambar;yambar"];
				profile.outputs = 	[
					{
						criteria = "Samsung Electric Company LC34G55T H4ZT903472";
						position = "0,0";
						mode = "3440x1440@165Hz";
					}
				];
			}
			{
				profile.name = "macbookpro";
				profile.exec = ["pkill yambar;yambar"];
				profile.outputs = 	[
					{
						criteria = "eDP-1";
						position = "0,0";
						mode = "1920x1080@60Hz";
						status = "enable";
					}
				];
			}
			
			{
				profile.name = "guru";
				profile.exec = ["pkill yambar;yambar"];
				profile.outputs = 	[
					{
						criteria = "Dell Inc. DELL U3421WE 24BZ653";
						position = "0,0";
						mode = "3440x1440@60Hz";
					}
					{
						criteria = "eDP-1";
						position = "0,0";
						mode = "1920x1080@60Hz";
						status = "disable";
					}
				];
			}

			{
				profile.name = "sahara";
				profile.outputs = [
					{
						criteria = "HDMI-1";
						position = "0,1080";
						mode = "2560x1440@60Hz";
					}
					{
						criteria = "eDP-1";
						position = "0,0";
						mode = "1920x1080@60Hz";
					}
				];
			}
			
			{
				profile.name = "sjostrand";
				profile.outputs = [
					{
						criteria = "ASUSTek COMPUTER INC ASUS VP249 K7LMTF133614";
						position = "1920,0";
						mode = "1920x1080@60Hz";
					}
					{
						criteria = "eDP-1";
						position = "0,0";
						mode = "1920x1080@60Hz";
					}
				];
			}


		];
	};
}
