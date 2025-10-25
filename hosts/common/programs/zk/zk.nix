{ pkgs, ... }:
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
  programs.pandoc.enable = true;
  programs.texlive.enable = true;

  home.packages = with pkgs; [
    python313Packages.weasyprint
    inter
    fira-mono
    fira-code
  ];

	home.file = {
		".config/zk/default.md".source = ./default.md;
	};

}
