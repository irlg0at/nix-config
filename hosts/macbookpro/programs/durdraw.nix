{ inputs, pkgs, ... }: {
  home.packages = [
    inputs.durdraw-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
