{ ... }:
{
		programs.zk = {
			enable = true;
			settings = {
				tool = {
					pager = "bat --theme=Dracula";	
				};

			};
	};
		programs.fzf.enable = true;

}
