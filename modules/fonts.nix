{ ... }:
{
  perSystem = { pkgs, ... }: {
    _module.args.fonts = rec {
      terminess = pkgs.nerd-fonts.terminess-ttf;

      # A self-contained fontconfig file that makes the packaged fonts above
      # discoverable to a wrapped app via env.FONTCONFIG_FILE, so the font is
      # pulled in as a store dependency of that app instead of relying on a
      # system-wide install.
      fontconfigFile = pkgs.makeFontsConf { fontDirectories = [ terminess ]; };
    };
  };
}
