{  ... }:
{
	programs.nixvim = {
    plugins = {
      nvim-tree = {
        enable = true;
      };
	  };
		keymaps = [
			{
				key = "<leader>n";
				action = "<cmd>NvimTreeToggle<cr>";
				desc = "Toggle nvim-tree";
			}

		];
	};
}
