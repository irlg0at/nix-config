{
  moduleWithSystem,
  inputs,
  ...
}: {

  flake.nixosModules.waybar = moduleWithSystem ({
    self',
    ...
  }: {
    environment.systemPackages = with self'.packages; [
        waybar
    ];
  });
  
  perSystem = {pkgs, scheme, fonts, ...}: {
    packages.waybar = inputs.wrapper-modules.wrappers.waybar.wrap {
      inherit pkgs;
      env.FONTCONFIG_FILE = fonts.fontconfigFile;
      settings = {
        modules-left = [ "niri/workspaces" ];
        modules-right = ["battery" "cpu" "temperature" "backlight" "network" "tray" "clock"];
        network = {
          format = "{ipaddr}";
        };
      };
      "style.css".content = ''
        * {
          font-family: Terminess Nerd Font;
        }

        #workspaces > * {
          padding-left: 0.5rem;
          margin-left: 0;
          padding-right: 0.5rem;
          margin-right: 0;
        }
        #workspaces button {
          min-width: 20px;
        }

        .modules-right > widget > * {
          padding-left: 0.5rem;
          margin-left: 0;
          padding-right: 0.5rem;
          margin-right: 0;
          color: #${scheme.base00};
        }

        window#waybar {
          background: #${scheme.base00};
        }

        #workspaces button {
          color: #${scheme.base01};
          border-radius: 0;
          padding: 0;
        }

        #workspaces button.active {
          color: #${scheme.base05};
        }

        #workspaces button.focused {
          background-color: #${scheme.base09};
          color: #${scheme.base00};
        }

        #battery {
          background-color: #${scheme.base0A};
        }

        #cpu {
          background-color: #${scheme.base0B};
        }

        #backlight {
          background-color: #${scheme.base0C};
        }

        #temperature {
          background-color: #${scheme.base0D};
        }

        #network {
          background-color: #${scheme.base0E};
        }

        #tray {
          background-color: #${scheme.base0F};
       }

        #clock {
          background-color: #${scheme.base08};
        }
      '';
    };
  };
}
