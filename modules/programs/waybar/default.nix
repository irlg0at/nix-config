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
  
  perSystem = {pkgs, ...}: {
    packages.waybar = inputs.wrapper-modules.wrappers.waybar.wrap {
      inherit pkgs;
      settings = {
        main = {
          modules-left = [ "niri/workspaces" ];
          modules-right = ["battery" "cpu" "temperature" "backlight" "network" "clock"];
        };
      };
    };
  };
}
