{ ... }:
{
	programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
				keymaps = {
					"<leader>ff" = {
						action = "find_files";
						options.desc = "TS: Find Files";
					};
					"<leader>fg" = {
						action = "live_grep";
						options.desc = "TS: Live Grep";
					};
					"<leader>fb" = {
						action = "buffers";
						options.desc = "TS: Buffers";
					};
					"<leader>fh" = {
						action = "help_tags";
						options.desc = "TS: Help Tags";
					};
				};
      };
    };
	};
	programs.ripgrep.enable = true;
}
