{ moduleWithSystem, ... }:
{
  flake.nixosModules.overleaf-sync = moduleWithSystem (
    { self', ... }:
    { ... }:
    {
      environment.systemPackages = [
        self'.packages.overleaf-sync
        self'.packages.overleaf-init
      ];
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

      packages.overleaf-init = pkgs.writeShellApplication {
        name = "overleaf-init";
        runtimeInputs = [
          self'.packages.gat
          pkgs.coreutils
          pkgs.gnugrep
        ];
        text = builtins.readFile ./overleaf-init.sh;
      };
    };
}
