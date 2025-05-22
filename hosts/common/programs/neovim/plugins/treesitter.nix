{  ... }:
{
	programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
				nixGrammars = true;
				settings = {
					highlight = {
						enable = true;
						disable = [
      				"latex"
    				];
						additional_vim_regex_highlighting = ["latex" "markdown"];
					};
					indent.enable = true;
      	};
    	};
		};
	};
}
