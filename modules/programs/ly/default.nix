{...}:
{
  flake.nixosModules.macbookproConfig = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.ly
    ];
    
    services.displayManager.ly = {
      enable = true;

      settings = {
        vi_mode = true;
        waylandsessions = "/etc/ly/sessions/";
        animation = "colormix";
      };
    };
  };
}



