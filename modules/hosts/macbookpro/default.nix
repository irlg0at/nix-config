{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.macbookpro = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      commonHosts
      macbookproConfig
    ];
  };
}
