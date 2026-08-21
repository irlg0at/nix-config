{
  moduleWithSystem,
  inputs,
  ...
}: {

  flake.nixosModules.mako = moduleWithSystem ({
    self',
    ...
  }: {
    environment.systemPackages = with self'.packages; [
        mako
    ];
  });

  perSystem = {pkgs, scheme, fonts, ...}: {
    packages.mako = inputs.wrapper-modules.wrappers.mako.wrap {
      inherit pkgs;
      env.FONTCONFIG_FILE = fonts.fontconfigFile;
      settings = with scheme.withHashtag; {
        font = "Terminess Nerd Font 9";
        background-color = base00;
        text-color = base05;
        border-color = base0D;
        border-size = 2;
        border-radius = 6;
        width = 260;
        height = 80;
        margin = 10;
        padding = 8;
        max-icon-size = 32;
        default-timeout = 5000;
        "urgency=high" = {
          border-color = base08;
        };
      };
    };
  };
}
