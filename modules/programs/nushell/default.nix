{
  moduleWithSystem,
  inputs,
  ...
}: {

  flake.nixosModules.nushell = moduleWithSystem ({
    self',
    ...
  }: {
    environment.systemPackages = with self'.packages; [
        nushell
    ];
  });

  perSystem = {pkgs, ...}:
  let
    zoxideInit = pkgs.runCommand "zoxide-init.nu" { } ''
      ${pkgs.zoxide}/bin/zoxide init nushell --cmd cd > $out
    '';
    starshipInit = pkgs.runCommand "starship-init.nu" { } ''
      export HOME=$TMPDIR
      ${pkgs.starship}/bin/starship init nu > $out
    '';
    starshipConfig = pkgs.runCommand "starship-pure.toml" { } ''
      export HOME=$TMPDIR
      ${pkgs.starship}/bin/starship preset pure-preset > $out
    '';
    direnvConfig = pkgs.writeTextDir "direnvrc"
      "source ${pkgs.nix-direnv}/share/nix-direnv/direnvrc";
  in {
    packages.nushell = inputs.wrapper-modules.wrappers.nushell.wrap {
      inherit pkgs;
      prefixVar = [ { name = "shellDeps"; data = [ "PATH" ":" "${pkgs.lib.makeBinPath [ pkgs.zoxide pkgs.starship pkgs.direnv ]}" ]; } ];
      env.STARSHIP_CONFIG = starshipConfig;
      env.BAT_THEME = "base16-256";
      env.DIRENV_CONFIG = direnvConfig;
      "config.nu".content = ''
        $env.config.show_banner = false
        source ${zoxideInit}
        use ${starshipInit}
        alias cat = ${pkgs.lib.getExe pkgs.bat} --paging=never
        $env.config.hooks.pre_prompt = ($env.config.hooks.pre_prompt | append {||
          let vars = (direnv export json | from json | default {})
          $vars | load-env
          if "PATH" in $vars { $env.PATH = ($vars.PATH | split row (char esep)) }
        })
      '';
    };
  };
}
