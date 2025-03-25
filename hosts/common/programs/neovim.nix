{self, pkgs, ...}:
{
  home-manager.users.g0at = { 
    programs.neovim = {
      enable = true;
    };

    home.file = {
      ".config/nvim" = {
        source = self + "/config/nvim/";
        recursive = true;
      };
    };
  };
}
