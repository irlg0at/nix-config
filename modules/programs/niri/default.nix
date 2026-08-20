{ inputs, moduleWithSystem, ... }: {


  flake.nixosModules.niri = moduleWithSystem ({ self', ... }: { ... }: {
    programs.niri = {
      enable = true;
      package = self'.packages.niri;
    };
  });

  perSystem = { pkgs, lib, scheme, self', ... }: {
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      # Output config is managed by nwg-displays, which writes to
      # ~/.config/niri/monitor.kdl; pull it in (optional so niri is fine
      # before the file exists) and let it override anything above it.
      extraSettings = [ { include = [ { optional = true; } "~/.config/niri/monitor.kdl" ]; } ];
      settings = {
        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        spawn-at-startup = [
          (lib.getExe self'.packages.waybar)
          (lib.getExe self'.packages.wallpaper)
          (lib.getExe pkgs.dunst)
        ];

        spawn-sh-at-startup = [ "${lib.getExe pkgs.wmname} LG3D" ];
        input = {
          focus-follows-mouse = _:{ };
          keyboard.xkb.layout = "no";

          touchpad = {
            tap = _:{ };
            click-method = "clickfinger";
          };
        };

        environment = {
          XDG_CURRENT_DESKTOP = "wlroots";
          XDG_SESSION_TYPE = "wayland";
          XDG_SESSION_DESKTOP = "wlroots";
        };

        layout = {
          gaps = 16;
          focus-ring = {
            width = 3;
            active-color = scheme.withHashtag.base0A;
            inactive-color = scheme.withHashtag.base0E;
            urgent-color = scheme.withHashtag.base08;
          };
        };

        prefer-no-csd = _:{ };

        binds = {
          "Mod+Shift+Return".spawn-sh = lib.getExe self'.packages.kitty;
          "Mod+P".spawn-sh = lib.getExe self'.packages.fuzzel;
          "Mod+Shift+P".spawn-sh = lib.getExe self'.packages.swaylock;
          "Mod+Shift+D".spawn-sh = lib.getExe pkgs.nwg-displays;

          # Move windows
          "Mod+Shift+C".close-window = _:{ };
          "Mod+Left".focus-column-left = _:{ };
          "Mod+Down".focus-window-down = _:{ };
          "Mod+Up".focus-window-up = _:{ };
          "Mod+Right".focus-column-right = _:{ };
          "Mod+H".focus-column-left = _:{ };
          "Mod+J".focus-window-down = _:{ };
          "Mod+K".focus-window-up = _:{ };
          "Mod+L".focus-column-right = _:{ };
          "Mod+Ctrl+Left".move-column-left = _:{ };
          "Mod+Ctrl+Down".move-window-down = _:{ };
          "Mod+Ctrl+Up".move-window-up = _:{ };
          "Mod+Ctrl+Right".move-column-right = _:{ };
          "Mod+Ctrl+H".move-column-left = _:{ };
          "Mod+Ctrl+J".move-window-down = _:{ };
          "Mod+Ctrl+K".move-window-up = _:{ };
          "Mod+Ctrl+L".move-column-right = _:{ };

          # Switch Workspace
          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;
          "Mod+6".focus-workspace = 6;
          "Mod+7".focus-workspace = 7;
          "Mod+8".focus-workspace = 8;
          "Mod+9".focus-workspace = 9;
          "Mod+Shift+1".move-column-to-workspace = 1;
          "Mod+Shift+2".move-column-to-workspace = 2;
          "Mod+Shift+3".move-column-to-workspace = 3;
          "Mod+Shift+4".move-column-to-workspace = 4;
          "Mod+Shift+5".move-column-to-workspace = 5;
          "Mod+Shift+6".move-column-to-workspace = 6;
          "Mod+Shift+7".move-column-to-workspace = 7;
          "Mod+Shift+8".move-column-to-workspace = 8;
          "Mod+Shift+9".move-column-to-workspace = 9;

          # Window Manipulation
          "Mod+Shift+R".switch-preset-window-height = _:{ };
          "Mod+Ctrl+R".reset-window-height = _:{ };
          "Mod+F".maximize-column = _:{ };
          "Mod+Shift+F".fullscreen-window = _:{ };
          "Mod+Shift+Q".quit = _:{ };
        };
      };
    };
  };
}
