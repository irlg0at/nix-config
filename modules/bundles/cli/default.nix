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
        wireguard-tools
        vja
    ];
  };  
}

