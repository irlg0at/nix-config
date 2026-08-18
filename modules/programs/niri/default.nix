{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        input.keyboard.xkb.layout = "no";
        layout.gaps =16;
        spawn-at-startup = [
          (lib.getExe pkgs.waybar)
          (lib.getExe' pkgs.awww "awww-daemon")
          (lib.getExe pkgs.dunst)
        ];

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
        };
      };
    };
  };
}
