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
    { system, pkgs, ... }:
    {
      nixvimConfigurations.neovim = inputs.nixvim.lib.evalNixvim {
        inherit system;
        modules = [
          config.flake.nixvimModules.default
          { nixpkgs.pkgs = pkgs; }
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
