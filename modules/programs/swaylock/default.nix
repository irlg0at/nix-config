{
  moduleWithSystem,
  inputs,
  ...
}: {

  flake.nixosModules.swaylock = moduleWithSystem ({
    self',
    ...
  }: {
    environment.systemPackages = with self'.packages; [
        swaylock
    ];
  });

  perSystem = {pkgs, scheme, ...}: {
    packages.swaylock = inputs.wrapper-modules.wrappers.swaylock.wrap {
      inherit pkgs;
      package = pkgs.swaylock-effects;
      settings = with scheme; {
        screenshots = true;
        effect-blur = "7x5";
        effect-vignette = "0.5:0.5";
        clock = true;
        fade-in = 0.2;
        indicator = true;
        indicator-radius = 110;
        indicator-thickness = 8;
        show-failed-attempts = true;

        color = base00;
        separator-color = base00;

        inside-color = base00;
        inside-clear-color = base00;
        inside-caps-lock-color = base00;
        inside-ver-color = base00;
        inside-wrong-color = base00;

        ring-color = base0D;
        ring-clear-color = base0A;
        ring-caps-lock-color = base09;
        ring-ver-color = base0B;
        ring-wrong-color = base08;

        key-hl-color = base0B;
        bs-hl-color = base08;
        caps-lock-key-hl-color = base09;
        caps-lock-bs-hl-color = base08;

        line-color = base00;
        line-clear-color = base00;
        line-caps-lock-color = base00;
        line-ver-color = base00;
        line-wrong-color = base00;

        text-color = base05;
        text-clear-color = base05;
        text-caps-lock-color = base05;
        text-ver-color = base05;
        text-wrong-color = base05;
      };
    };
  };
}
