{ moduleWithSystem, ... }:
{
  flake.nixosModules.macbookproConfig = moduleWithSystem ({ scheme, ... }: { pkgs, ... }:
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

        bg = hex base00;
        fg = hex base05;
        border_fg = hex base0D;
        error_bg = hex base00;
        error_fg = hex base08;

        colormix_col1 = hex base0D;
        colormix_col2 = hex base0E;
        colormix_col3 = hex base00;
      };
    };
  });
}
