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
        zathura
        ranger
        claude-code
    ];
  };  
}

