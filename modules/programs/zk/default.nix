{ inputs, moduleWithSystem, ... }: {
  flake.nixosModules.zk = moduleWithSystem ({ self', ... }: {
    environment.systemPackages = [ self'.packages.zk ];
  });

  perSystem = { pkgs, ... }: {
    packages.zk = inputs.wrapper-modules.lib.wrapPackage ({ config, ... }: {
      inherit pkgs;
      package = pkgs.zk;
      runtimePkgs = [ pkgs.bat ];
      env.XDG_CONFIG_HOME = placeholder config.outputName;
      constructFiles.config = {
        relPath = "zk/config.toml";
        content = ''
          [tool]
          pager = "bat --theme=Dracula"
          [note]
          template = "${placeholder config.outputName}/zk/default.md"
        '';
      };
      constructFiles.template = {
        relPath = "zk/default.md";
        content = ''
          ---
          title: {{title}}
          date: {{format-date now "full"}}
          tags: []
          ---
        '';
      };
    });
  };
}
