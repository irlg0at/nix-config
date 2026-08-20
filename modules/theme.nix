{ inputs, ... }:
{
  perSystem = { pkgs, ... }: {
    _module.args.scheme =
      (pkgs.callPackage inputs.base16.lib { })
        .mkSchemeAttrs
          "${inputs.tt-schemes}/base16/catppuccin-mocha.yaml";
  };

  flake.nixosModules.theme = { pkgs, ... }:
  let
    gtkTheme = pkgs.catppuccin-gtk.override {
      accents = [ "blue" ];
      variant = "mocha";
      size = "standard";
    };
    kvantumTheme = pkgs.catppuccin-kvantum.override {
      accent = "blue";
      variant = "mocha";
    };
    cursorTheme = pkgs.catppuccin-cursors.mochaDark;

    gtkThemeName = "catppuccin-mocha-blue-standard";
    kvantumThemeName = "catppuccin-mocha-blue";
    iconThemeName = "Papirus-Dark";
    cursorThemeName = "catppuccin-mocha-dark-cursors";
  in {
    environment.systemPackages = [
      gtkTheme
      kvantumTheme
      cursorTheme
      pkgs.papirus-icon-theme
    ];

    environment.sessionVariables = {
      GTK_THEME = gtkThemeName;
      XCURSOR_THEME = cursorThemeName;
      XCURSOR_SIZE = "24";
    };

    environment.etc."xdg/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-theme-name=${gtkThemeName}
      gtk-icon-theme-name=${iconThemeName}
      gtk-cursor-theme-name=${cursorThemeName}
      gtk-application-prefer-dark-theme=1
    '';
    environment.etc."xdg/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-theme-name=${gtkThemeName}
      gtk-icon-theme-name=${iconThemeName}
      gtk-cursor-theme-name=${cursorThemeName}
      gtk-application-prefer-dark-theme=1
    '';

    programs.dconf.enable = true;
    programs.dconf.profiles.user.databases = [
      {
        settings."org/gnome/desktop/interface" = {
          gtk-theme = gtkThemeName;
          icon-theme = iconThemeName;
          cursor-theme = cursorThemeName;
          color-scheme = "prefer-dark";
        };
      }
    ];

    qt.enable = true;
    qt.platformTheme = "qt5ct";
    qt.style = "kvantum";
    environment.etc."xdg/Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=${kvantumThemeName}
    '';
  };
}
