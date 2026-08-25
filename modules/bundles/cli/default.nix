{
  ...
}: {

  flake.nixosModules.cli = {
    pkgs,
    ...
  }:
    {
    environment.systemPackages = with pkgs; [
        ripgrep
        ranger
        claude-code
        alsa-utils
        zk
        taskwarrior3
        taskwarrior-tui
        wireguard-tools
    ];
  };  
}

