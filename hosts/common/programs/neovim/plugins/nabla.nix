{  ... }:
{
	programs.nixvim = {
    plugins = {
      nabla = {
        enable = true;
      };
    };
		keymaps = [
			{
				key = "<leader>P";
				mode = "n";
				action = "<cmd>lua require('nabla').popup({border = 'rounded'})<CR>";
				options.desc = "Open nabla formula preview";

			}
		];
	};
}
