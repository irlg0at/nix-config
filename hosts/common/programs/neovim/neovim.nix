{inputs,...}:
{
	
	imports = [
	inputs.nixvim.homeManagerModules.nixvim	
	./plugins/blink.nix
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
					rust-analyzer.enable = true;
					nixd.enable = true;
					gopls.enable = true;
					jsonls.enable = true;
					html.enable = true;
					yamlls.enable = true;
					omnisharp.enable = true;
					dotls.enable = true;
					lua-ls.enable = true;
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
