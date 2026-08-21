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
        font = "Terminess Nerd Font 11";
        background-color = base00;
        text-color = base05;
        border-color = base0D;
        border-size = 3;
        border-radius = 8;
        margin = 16;
        padding = 12;
        default-timeout = 5000;
        "urgency=high" = {
          border-color = base08;
        };
      };
    };
  };
}
