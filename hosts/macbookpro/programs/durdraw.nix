{ inputs, pkgs, ... }: {
  home.packages = [
    inputs.durdraw-nix.packages.${pkgs.system}.default
  ];
}
