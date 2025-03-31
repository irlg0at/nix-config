{...}:
{
	programs.yambar = {
		enable = true;
	};

	home.file = {
  ".config/yambar/config.yml".source = ./config.yml;
	};
}
