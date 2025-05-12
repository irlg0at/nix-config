{ pkgs, lib, config, ...}:
{
		programs.tmux = {
			enable = true;
			shell = "${pkgs.fish}/bin/fish";
			terminal = "tmux-256color";
			escapeTime = 300;
			keyMode = "vi";
			plugins = with pkgs; 
			[
				{
					plugin = tmuxPlugins.dracula;
					extraConfig = "set -g @dracula-show-powerline true";
				}
			];

			extraConfig = ""
			+lib.optionalString config.programs.nixvim.plugins.image.enable ''
			set -gq allow-passthrough on
			set -g visual-activity off
			''
			;

	};
}
