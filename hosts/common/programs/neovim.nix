{self, pkgs, ...}:
{
  home-manager.users.g0at = { 
    programs.nixvim = {
      enable = true;

      colorschemes.dracula.enable = true;

			globals = {
				mapleader = " ";
				maplocaleader = " ";
			};

      opts = {
				number = true;
				tabstop = 2;
				shiftwidth = 2;
				conceallevel = 2;
				syntax = "on";
      };
    };
  };
}
