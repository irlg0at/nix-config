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
    { system, ... }:
    {
      nixvimConfigurations.neovim = inputs.nixvim.lib.evalNixvim {
        inherit system;
        modules = [
          config.flake.nixvimModules.default
          {
            # Use nixpkgs_stable (nixos-25.11) here, matching the nixvim
            # release this flake pins. Nixvim's generated Lua assumes the
            # plugin API shape from its own nixpkgs revision; nixpkgs
            # unstable has since shipped an incompatible nvim-treesitter
            # rewrite, which breaks nixvim's `plugins.treesitter` module.
            nixpkgs.pkgs = import inputs.nixpkgs_stable {
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
