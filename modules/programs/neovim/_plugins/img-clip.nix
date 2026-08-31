{ ... }:
{
  plugins = {
    img-clip = {
      enable = true;
    };
  };
  keymaps = [
		{
			key = "<leader>pi";
			mode = "n";
			action = "<cmd>PasteImage<cr>";
			options.desc = "Paste image from system clipboard";
		}
  ];
}
