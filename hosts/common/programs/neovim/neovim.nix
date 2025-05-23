{ inputs, ... }:
{

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/blink.nix
    ./plugins/lualine.nix
    ./plugins/whichkey.nix
    ./plugins/render-markdown.nix
    ./plugins/mkdnflow.nix
    ./plugins/nvim-tree.nix
    ./plugins/vimtex.nix
    ./plugins/zk.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/image.nix
    ./plugins/ltex-extra.nix
		./plugins/luasnip/luasnip.nix
		./plugins/nabla.nix
		./plugins/luasnip-latex-snippets.nix
		./plugins/indent-blankline.nix
  ];
  programs.fish.interactiveShellInit = "set EDITOR nvim";
  programs.nixvim = {
    enable = true;

    colorschemes.dracula.enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    plugins.lsp = {
      enable = true;
      servers = {
        ruff.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        nixd.enable = true;
        gopls.enable = true;
        jsonls.enable = true;
        html.enable = true;
        yamlls.enable = true;
        omnisharp.enable = true;
        dotls.enable = true;
        lua_ls.enable = true;
        cssls.enable = true;
        zk.enable = true;
				texlab.enable = true;
				ltex = {
					enable = true;
					settings = {
						ltex = {
							language = "en-US";
						};
					};
				};
      };
    };
		
		keymaps = [
			{
				key = "K";
				mode = "n";
				action = "<cmd>lua vim.diagnostic.open_float()<CR>";
				options.desc = "Show LSP hint";
			}
			{
				key = "ca";
				mode = "n";
				action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
				options.desc = "Code action";
			}
		];

    opts = {
      number = true;
      tabstop = 2;
      shiftwidth = 2;
      conceallevel = 2;
      syntax = "on";
    };
  };

}
