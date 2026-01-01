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
        modules-right = ["battery" "cpu" "temperature" "backlight" "network" "clock"];
      };
    };
  
    style = ''

      * {
        font-family: Terminess Nerd Font;
      }

      .modules-right > widget > * {
        padding-left: ${padding};
        margin-left: 0;
        padding-right: ${padding};
        margin-right: 0;
        color: #${config.colorScheme.palette.base00};
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



      #battery {
        background-color: #${config.colorScheme.palette.base0A};
      }
      
      #cpu {
        background-color: #${config.colorScheme.palette.base0B};
      }
      
      #backlight {
        background-color: #${config.colorScheme.palette.base0C};
      }
      
      #temperature {
        background-color: #${config.colorScheme.palette.base0D};
      }
      
      #network {
        background-color: #${config.colorScheme.palette.base0E};
      }
      
      #clock {
        background-color: #${config.colorScheme.palette.base0F};
      }
      '';
	};
}
