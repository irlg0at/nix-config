{  ... }:
{
	programs.nixvim = {
    plugins = {
      zk = {
        enable = true;
				settings = {
					picker = "telescope";
				};
      };
    };

		files = {
			"ftplugin/markdown.lua" = {
				keymaps = [
					{
						key = "<leader>zn";
						mode = "n";
						action = "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>";
						options.desc = "Zk: New note";
					}
					{
						key = "<leader>zl";
						mode = "n";
						action = "<Cmd>ZkInsertLink<CR>";
						options.desc = "Zk: Insert link";
					}
					{
						key = "<leader>zN";
						mode = "n";
						action = "<Cmd>ZkNewFromTitleSelection<CR>";
						options.desc = "Zk: New note from title selection";
					}
					{
						key = "<leader>zf";
						mode = "n";
						action = "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>";
						options.desc = "Zk: Find note based on content";
					}
					{
						key = "<leader>zt";
						mode = "n";
						action = "<Cmd>ZkTags<CR>";
						options.desc = "Zk: Filter by tag";
					}
					{
						key = "<leader>zb";
						mode = "n";
						action = "<Cmd>ZkBacklinks<CR>";
						options.desc = "Zk: Open notes linking to current buffer";
					}
				];
			};

		};

	};
}
