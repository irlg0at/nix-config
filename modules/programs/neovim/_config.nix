{ ... }:
{
  imports = [
    ./_plugins/blink.nix
    ./_plugins/lualine.nix
    ./_plugins/whichkey.nix
    ./_plugins/render-markdown.nix
    ./_plugins/mkdnflow.nix
    ./_plugins/nvim-tree.nix
    ./_plugins/vimtex.nix
    ./_plugins/zk.nix
    ./_plugins/telescope.nix
    ./_plugins/treesitter.nix
    ./_plugins/image.nix
    ./_plugins/ltex-extra.nix
    ./_plugins/luasnip/luasnip.nix
    ./_plugins/nabla.nix
    ./_plugins/luasnip-latex-snippets.nix
    ./_plugins/indent-blankline.nix
    ./_plugins/molten.nix
    ./_plugins/jupytext.nix
    ./_plugins/quarto.nix
    ./_plugins/undotree.nix
    ./_plugins/img-clip.nix
  ];

  colorschemes.catppuccin.enable = true;

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  plugins.lsp = {
    enable = true;
    servers = {
      ruff.enable = true;
      pyright.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      nixd.enable = true;
      ts_ls.enable = true;
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
      ccls.enable = true;
      ltex = {
        enable = true;
        settings.ltex.language = "en-US";
      };
    };
  };

  keymaps = [
    {
      key = "D";
      mode = "n";
      action = "<cmd>lua vim.diagnostic.open_float()<CR>";
      options.desc = "Show LSP diagnostic hint";
    }
    {
      key = "K";
      mode = "n";
      action = "<cmd>:lua vim.lsp.buf.hover()<CR>";
      options.desc = "Show LSP documentation";
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
    expandtab = true;
    syntax = "on";
  };

  # extraConfigVim = ''
  #   let g:clipboard = {
  #     \   'name': 'WslClipboard',
  #     \   'copy': {
  #     \      '+': 'clip.exe',
  #     \      '*': 'clip.exe',
  #     \    },
  #     \   'paste': {
  #     \      '+': 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  #     \      '*': 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  #     \   },
  #     \   'cache_enabled': 0,
  #     \ }
  # '';
}
