{ pkgs, ...}:
{
		programs.tmux = {
			enable = true;
			shell = "${pkgs.fish}/bin/fish";
			terminal = "tmux-256color";
			keyMode = "vi";
			plugins = with pkgs; 
			[
				{
					plugin = tmuxPlugins.dracula;
					extraConfig = "set -g @dracula-show-powerline true";
				}
			];

	};
}
