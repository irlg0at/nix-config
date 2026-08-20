{
  moduleWithSystem,
  inputs,
  ...
}: {

  flake.nixosModules.fuzzel = moduleWithSystem ({
    self',
    ...
  }: {
    environment.systemPackages = with self'.packages; [
        fuzzel
    ];
  });

  perSystem = {pkgs, scheme, fonts, ...}: {
    packages.fuzzel = inputs.wrapper-modules.wrappers.fuzzel.wrap {
      inherit pkgs;
      env.FONTCONFIG_FILE = fonts.fontconfigFile;
      settings = {
        main = {
          font = "Terminess Nerd Font:size=14";
        };
        colors = with scheme; {
          background = "${base00}ff";
          text = "${base05}ff";
          match = "${base0D}ff";
          selection = "${base02}ff";
          selection-text = "${base05}ff";
          selection-match = "${base0D}ff";
          border = "${base0D}ff";
        };
      };
    };
  };
}
