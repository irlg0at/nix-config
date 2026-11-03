{ moduleWithSystem, ... }:
{
  flake.nixosModules.overleaf-sync = moduleWithSystem (
    { self', ... }:
    { ... }:
    {
      environment.systemPackages = [ self'.packages.overleaf-sync ];
    }
  );

  perSystem =
    { pkgs, self', ... }:
    {
      packages.overleaf-sync = pkgs.writeShellApplication {
        name = "overleaf-sync";
        runtimeInputs = [
          self'.packages.gat
          pkgs.coreutils
        ];
        text = builtins.readFile ./overleaf-sync.sh;
      };
    };
}
