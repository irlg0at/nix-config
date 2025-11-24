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
				profile.name = "oven_one_screen";
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
						criteria = "BOE NE135A1M-NY1 Unknown";
						position = "0,0";
						mode = "2880x1920@120Hz";
            scale = 1.7;
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
						criteria = "BOE NE135A1M-NY1 Unknown";
						position = "0,0";
						mode = "2880x1920@120Hz";
            scale = 1.7;
						status = "enable";
					}
				];
			}

			{
				profile.name = "sahara";
				profile.exec = ["pkill yambar;yambar"];
				profile.outputs = [
					{
						criteria = "Dell Inc. DELL U2715H GH85D49T0LDL";
						position = "0,0";
						mode = "2560x1440@60Hz";
					}
					{
						criteria = "BOE NE135A1M-NY1 Unknown";
						position = "0,0";
						mode = "2880x1920@120Hz";
            scale = 1.7;
						status = "enable";
					}
				];
			}
			
			{
				profile.name = "sjostrand";
				profile.exec = ["pkill yambar;yambar"];
				profile.outputs = [
					{
						criteria = "ASUSTek COMPUTER INC ASUS VP249 K7LMTF133614";
						position = "1920,0";
						mode = "1920x1080@60Hz";
					}
					{
						criteria = "BOE NE135A1M-NY1 Unknown";
						position = "0,0";
						mode = "2880x1920@120Hz";
            scale = 1.7;
						status = "enable";
					}
				];
			}
      
			   {
				profile.name = "lenovo";
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


		];
	};
}
