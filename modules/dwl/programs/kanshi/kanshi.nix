{...}:
{
	programs.kanshi = {
		enable = true;
	};

	home.file = {
  	".config/kanshi/config.yml".source = ./config;
	};
}
