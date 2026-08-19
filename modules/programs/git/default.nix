{
  moduleWithSystem,
  inputs,
  ...
}: {

  flake.nixosModules.git = moduleWithSystem ({
    self',
    ...
  }: {
    environment.systemPackages = with self'.packages; [
        gat
    ];
  });
  
  perSystem = {pkgs, ...}: {
    packages.gat = inputs.wrapper-modules.wrappers.git.wrap {
      inherit pkgs;
      settings = {
        user.email = "34748847+irlg0at@users.noreply.github.com";
        user.name = "g0at";
      };
    };
  };
}

