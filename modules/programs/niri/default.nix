{
  moduleWithSystem,
  inputs,
  ...
}: {

  flake.nixosModules.niri = moduleWithSystem ({
    self',
    ...
  }: {
    environment.systemPackages = with self'.packages; [
        niri
    ];
  });
  
  perSystem = {pkgs, ...}: {
    packages.niri = inputs.wrappers.wrappers.niri.wrap {
       # TODO
    };
  };
}
