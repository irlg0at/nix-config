{ inputs, ... }:
{
  perSystem = { pkgs, ... }: {
    _module.args.scheme =
      (pkgs.callPackage inputs.base16.lib { })
        .mkSchemeAttrs
          "${inputs.tt-schemes}/base16/catppuccin-mocha.yaml";
  };
}
