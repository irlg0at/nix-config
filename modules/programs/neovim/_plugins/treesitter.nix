{ ... }:
{
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      highlight = {
        enable = true;
        disable = [ "latex" ];
        enableVimSyntax = [
          "latex"
          "markdown"
        ];
      };
      indent.enable = true;
    };
  };
}
