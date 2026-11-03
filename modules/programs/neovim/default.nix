{
  inputs,
  config,
  moduleWithSystem,
  ...
}:
{
  imports = [ inputs.nixvim.flakeModules.default ];

  flake.nixvimModules.default = ./_config.nix;

  perSystem =
    { system, self', ... }:
    {
      nixvimConfigurations.neovim = inputs.nixvim.lib.evalNixvim {
        inherit system;
        modules = [
          config.flake.nixvimModules.default
          {
            _module.args.overleafSync = self'.packages.overleaf-sync;
            nixpkgs.pkgs = import inputs.nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
          }
        ];
      };
    };

  nixvim.packages.enable = true;
  nixvim.checks.enable = true;

  flake.nixosModules.neovim = moduleWithSystem (
    { self', ... }:
    { lib, ... }:
    {
      environment.systemPackages = [ self'.packages.neovim ];
      environment.variables.EDITOR = lib.mkOverride 900 "nvim";
      environment.shellAliases.vimdiff = "nvim -d";
    }
  );
}
