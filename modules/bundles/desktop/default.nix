{
  ...
}:
{
  flake.nixosModules.desktop =
    {
      pkgs,
      ...
    }:
    {
      nixpkgs.config.permittedInsecurePackages = [
        "firefox-esr-140-bin-unwrapped-140.17.0esr"
      ];
      environment.systemPackages = with pkgs; [
        vivaldi
        gns3-gui
        vesktop
        protonmail-desktop
        zotero
        plex-desktop
        plexamp
      ];
    };
}
