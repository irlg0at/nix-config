{ self, ... }:
let
  version = "2.2.61";

  gns3Overlay = final: prev: {
    gns3-server = prev.gns3-server.overrideAttrs (_: {
      inherit version;
      src = final.fetchFromGitHub {
        owner = "GNS3";
        repo = "gns3-server";
        tag = "v${version}";
        hash = "sha256-jLDD2sVWwVBjXv6tvxyYDwo2wEdzoH5uUjXc0IpZSq0=";
      };
    });

    gns3-gui = prev.gns3-gui.overridePythonAttrs (old: {
      inherit version;
      src = final.fetchFromGitHub {
        owner = "GNS3";
        repo = "gns3-gui";
        tag = "v${version}";
        hash = "sha256-BgLJC5boDCpQXr//5uans/Efqihmce+HCf4+xJAlxTE=";
      };
      # Patch was merged upstream; it no longer applies to this tag.
      patches = [ ];
      # 2.2.61 pulls in qdarkstyle at runtime.
      dependencies = (old.dependencies or [ ]) ++ [ final.python3Packages.qdarkstyle ];

      # Default telnet console command on NixOS is Xterm (not installed).
      # Use kitty instead so double-clicking a node opens a terminal.
      postPatch = (old.postPatch or "") + ''
        substituteInPlace gns3/settings.py \
          --replace-fail \
            'DEFAULT_TELNET_CONSOLE_COMMAND = PRECONFIGURED_TELNET_CONSOLE_COMMANDS["Xterm"]' \
            'DEFAULT_TELNET_CONSOLE_COMMAND = PRECONFIGURED_TELNET_CONSOLE_COMMANDS["kitty"]'
      '';

      # PyQt6 finds qtbase's built-in plugins, but the SVG image-format plugin
      # lives in the separate qtsvg output that Qt never searches, so node
      # symbols fail to render ("SVG not supported"). Put qtsvg's plugin dir on
      # QT_PLUGIN_PATH. Also make kitty (and the telnet client it launches)
      # available so the console command resolves at runtime, plus wireshark so
      # link packet capture ("Start Wireshark") works out of the box.
      makeWrapperArgs = (old.makeWrapperArgs or [ ]) ++ [
        # Use the themed (wrapper-modules) kitty so node consoles share the
        # global base16 kitty config instead of the unwrapped nixpkgs kitty.
        "--prefix PATH : ${final.lib.makeBinPath [ self.packages.${final.stdenv.hostPlatform.system}.kitty final.inetutils final.wireshark ]}"
        "--prefix QT_PLUGIN_PATH : ${final.qt6.qtsvg}/${final.qt6.qtbase.qtPluginPrefix}"
      ];
    });
  };
in
{
  flake.overlays.gns3 = gns3Overlay;

  flake.nixosModules.gns3Overlay = {
    nixpkgs.overlays = [ gns3Overlay ];
  };
}
