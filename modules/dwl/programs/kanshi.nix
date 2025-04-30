{...}:
{
	services.kanshi = {
		enable = true;	
		settings = [
			{
			profile.name = "oven";
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
		];
	};
}
