{config, ...}:
let 
  padding = "0.5rem";
in
{
	programs.waybar = {
		enable = true;
    settings = {
      main = {
        modules-left = ["dwl/tags"];
        modules-right = ["battery" "temperature" "backlight" "network" "clock"];
      };
    };
  
    style = ''

      * {
        font-family: Terminess Nerd Font;
      }

      .modules-right > widget > * {
        margin-left: ${padding};
        margin-right: ${padding};
      }

      window#waybar {
        background: #${config.colorScheme.palette.base00};

      }

      #tags button {
        color: #${config.colorScheme.palette.base01};
        padding: 0 3px;   
      }

      #tags button.occupied {
        color: #${config.colorScheme.palette.base05};
      }

      #tags button.focused {
        color: #${config.colorScheme.palette.base09};
      }

      #tags button.urgent {
        color: #${config.colorScheme.palette.base08};
      }


      '';
	};
}
