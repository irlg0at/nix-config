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
      ly
      niri
      theme
      kitty
      fuzzel
      mako
      swaylock
      neovim
      nushell
      tmux
      waybar
      desktop
      cli
      python
      git
      gns3Overlay
      inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
      zathura
      zk
    ];
  };
}
