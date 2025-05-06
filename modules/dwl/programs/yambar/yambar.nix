{pkgs, host, ...}:
let 
	configuration = pkgs.writeText "yambar-config.yml" (
		builtins.readFile ./config-top.yml +
		builtins.readFile ./config-${host}.yml + 
		builtins.readFile ./config-bottom.yml
	);
in {
	programs.yambar = {
		enable = true;
	};

	home.file = {
		".config/yambar/config.yml".source = configuration;
	};
}
