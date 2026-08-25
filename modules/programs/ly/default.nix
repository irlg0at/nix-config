{ moduleWithSystem, ... }:
{
  flake.nixosModules.ly = moduleWithSystem ({ scheme, ... }: { pkgs, ... }:
  let
    hex = c: "0x00${c}";
  in {
    environment.systemPackages = [
      pkgs.ly
    ];

    services.displayManager.ly = {
      enable = true;

      settings = with scheme; {
        vi_mode = true;
        animation = "colormix";
        full_color = true;

        bg = hex base00;
        fg = hex base05;
        border_fg = "0x001E90FF";
        error_bg = hex base00;
        error_fg = "0x00FF0000";

        colormix_col1 = "0x000000FF";
        colormix_col2 = "0x00FF00FF";
        colormix_col3 = "0x0000FFFF";
      };
    };
  });
}
