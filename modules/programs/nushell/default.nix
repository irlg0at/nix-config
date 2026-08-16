{
  moduleWithSystem,
  inputs,
  ...
}: {

  flake.nixosModules.nushell = moduleWithSystem ({
    self',
    ...
  }: {
    environment.systemPackages = with self'.packages; [
        nushell
    ];
  });
  
  perSystem = {pkgs, ...}: {
    packages.nushell = inputs.wrappers.wrappers.nushell.wrap {
      inherit pkgs;
       # TODO
    };
  };
}
