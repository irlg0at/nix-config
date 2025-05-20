{ ... }:
{
		programs.zk = {
			enable = true;
			settings = {
				tool = {
					pager = "bat --theme=Dracula";
				};
				note = {
					template = "~/.config/zk/default.md";
				};
			};
	};
		programs.fzf.enable = true;

	home.file = {
		".config/zk/default.md".source = ./default.md;
	};

}
