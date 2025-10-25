{  ... }:
{
	programs.nixvim = {
    plugins = {
      undotree = {
        enable = true;
      };
    };
		keymaps = [
			{
				key = "<leader>u";
				action = "<cmd>Undotreetoggle<cr>";
				options.desc = "Toggle undotree";
			}
    ];
	};
}
