{ self, inputs, ... }: {


  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
    };
  };

  perSystem = { pkgs, lib, scheme, ... }: {
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        input.keyboard.xkb.layout = "no";

        outputs."eDP-1" = {
          mode = "2880x1920@120.030";
          scale = 1;
          position = _: { props = { x = 1280; y = 0; }; };
        };

        spawn-at-startup = [
          (lib.getExe pkgs.waybar)
          (lib.getExe' pkgs.awww "awww-daemon")
          (lib.getExe pkgs.dunst)
          (lib.getExe pkgs.kanshi)
        ];

        spawn-sh-at-startup = [ "${lib.getExe pkgs.wmname} LG3D" ];

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
          "Mod+Shift+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+P".spawn-sh = lib.getExe pkgs.fuzzel;
          "Mod+Shift+P".spawn-sh = lib.getExe pkgs.swaylock;

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
