{  pkgs, ... }:
{
	programs.nixvim = {
		extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
				name = "luasnip-latex-snippets";
				src = pkgs.fetchFromGitHub {
						owner = "iurimateus";
						repo = "luasnip-latex-snippets.nvim";
						rev = "498f4ba12d025487939d89b801647b44bb15676c";
						hash = "sha256-QWZIw/ZafnNa1j20TI361X9+x3nleZgBchiJ5tMw+Qw=";
				};
			  doCheck = false;
		})];
		extraConfigLua = "require('luasnip-latex-snippets').setup({allow_on_markdown = true})";
	};
}
