{
  ...
}: {

  flake.nixosModules.desktop = {
    pkgs,
    ...
  }: {
    environment.systemPackages = with pkgs; [
      vivaldi
    ];
  }; 
}

