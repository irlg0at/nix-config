{
  moduleWithSystem,
  inputs,
  ...
}: {

  flake.nixosModules.tmux = moduleWithSystem ({
    self',
    ...
  }: {
    environment.systemPackages = with self'.packages; [
        tmux
    ];
  });
  
  perSystem = {pkgs, ...}: {
    packages.tmux = inputs.wrappers.wrappers.tmux.wrap {
      inherit pkgs;
      allowPassthrough = true;
      visualActivity = false;
			terminal = "tmux-256color";
			escapeTime = 300;
			modeKeys = "vi";
      vimVisualKeys = true;
    };
  };
}
