{
  ...
}: {

  flake.nixosModules.desktop = {
    pkgs,
    ...
  }: {
    environment.systemPackages = with pkgs; [
      vivaldi
      gns3-gui
    ];
  }; 
}

