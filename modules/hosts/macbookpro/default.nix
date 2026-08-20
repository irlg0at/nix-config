{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.macbookpro = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      commonHosts
      macbookproConfig
      macbookproHardwareConfig
      niri
      theme
      kitty
      fuzzel
      swaylock
      neovim
      nushell
      tmux
      waybar
      desktop
      cli
      git
      gns3Overlay
    ];
  };
}
