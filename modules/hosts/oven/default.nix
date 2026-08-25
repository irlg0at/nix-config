{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.oven = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      commonHosts
      ovenConfig
      ovenHardwareConfig
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
      git
      zathura
    ];
  };
}
