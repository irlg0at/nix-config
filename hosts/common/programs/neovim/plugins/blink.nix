{  ... }:
{
	programs.nixvim = {
    plugins = {
      blink-cmp = {
        enable = true;
        settings = {
		      snippets.preset = "luasnip";
        };
      };
    };
	};
}
