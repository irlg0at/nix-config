{ ... }:
{
  dependencies.sqlite.enable = true;
  plugins = {
    conform-nvim = {
      enable = true;
      autoInstall.enable = true;
      settings = {
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          tex = [ "tex-fmt" ];
          bib = [ "bibtex-tidy" ];
        };
        format_on_save = {
          timeout_ms = 500;
          lsp_format = "fallback";
        };
      };
    };
  };
}
