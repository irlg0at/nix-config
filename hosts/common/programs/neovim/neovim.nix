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
