{pkgs,config, ...}:
{
	gtk = {
		enable = true;
		iconTheme = {
			name = "Dracula";
			package = pkgs.dracula-theme;
		};

		theme = {
			package = pkgs.dracula-theme;
			name = "Dracula";
		};
		
		cursorTheme = {
			name = "Dracula-cursors";
			package = pkgs.dracula-theme;
		};

    gtk4.theme = config.gtk.theme;
	};
  
  home.pointerCursor = {
    package = pkgs.dracula-theme;
    name = "Dracula-cursors";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
	
  qt = {
		enable = true;
		platformTheme.name = "gtk";
		style.name = "Dracula";
		style.package = pkgs.dracula-qt5-theme;
	};


}
