{inputs,...}:
{
	
	imports = [
	inputs.nixvim.homeManagerModules.nixvim	
	./plugins/blink.nix
	./plugins/lualine.nix
	./plugins/whichkey.nix
	./plugins/render-markdown.nix
	./plugins/mkdnflow.nix
	./plugins/nvim-tree.nix
	];

    programs.nixvim = {
      enable = true;

      colorschemes.dracula.enable = true;

			globals = {
				mapleader = " ";
				maplocaleader = " ";
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
				};
			};

      opts = {
				number = true;
				tabstop = 2;
				shiftwidth = 2;
				conceallevel = 2;
				syntax = "on";
      };
    };
	
}
