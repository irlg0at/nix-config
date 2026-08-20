{ inputs, ... }:
let
  # Single source of truth: switch the whole desktop (base16 colors + GTK +
  # Qt + icons + cursor) by changing these two.
  flavor = "mocha"; # mocha | macchiato | frappe | latte (latte is light)
  accent = "blue";

  schemeYaml = "${inputs.tt-schemes}/base16/catppuccin-${flavor}.yaml";
  gtkThemeName = "catppuccin-${flavor}-${accent}-standard";
  kvantumThemeName = "catppuccin-${flavor}-${accent}";
  cursorThemeName = "catppuccin-${flavor}-dark-cursors";
  iconThemeName = "Papirus-Dark";
in
{
  perSystem = { pkgs, ... }: {
    _module.args.scheme =
      (pkgs.callPackage inputs.base16.lib { }).mkSchemeAttrs schemeYaml;
  };

  flake.nixosModules.theme = { pkgs, ... }:
  let
    gtkTheme = pkgs.catppuccin-gtk.override {
      accents = [ accent ];
      variant = flavor;
      size = "standard";
    };
    kvantumTheme = pkgs.catppuccin-kvantum.override {
      inherit accent;
      variant = flavor;
    };
    cursorTheme = pkgs.catppuccin-cursors."${flavor}Dark";
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
