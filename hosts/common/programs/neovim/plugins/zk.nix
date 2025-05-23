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
				];
			};

		};

	};
}
