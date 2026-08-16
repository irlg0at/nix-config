{  ... }:
{
	programs.nixvim = {
    plugins = {
      nvim-tree = {
        enable = true;
      };
		web-devicons.enable = true;
	  };
		keymaps = [
			{
				key = "<leader>n";
				action = "<cmd>NvimTreeToggle<cr>";
				options.desc = "Toggle nvim-tree";
			}

		];
	};
}
