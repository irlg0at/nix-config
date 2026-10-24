{ ... }:
{
  plugins = {
    oil = {
      enable = true;
    };
  };
  keymaps = [
    {
      key = "<leader>n";
      mode = "n";
      action = "<cmd>Oil<cr>";
      options.desc = "Open parent directory";
    }
  ];
}
