{
  moduleWithSystem,
  inputs,
  ...
}: {

  flake.nixosModules.zathura = moduleWithSystem ({
    self',
    ...
  }: {
    environment.systemPackages = with self'.packages; [
      zathura 
    ];
  });
  
  perSystem = {pkgs, ...}: {
    packages.zathura = inputs.wrapper-modules.wrappers.zathura.wrap {
      inherit pkgs;
      settings = {
        selection-clipboard = "clipboard";
      };
    };
  };
}
