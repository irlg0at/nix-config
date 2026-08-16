{
  flake.nixosModules.commonHosts = {...}: {

  nix.settings.experimental-features = ["nix-command" "flakes"];
  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };
  console.keyMap = "no";
  users.users.g0at = {
    isNormalUser = true;
    description = "g0at";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  nixpkgs.config.allowUnfree = true;
  networking.firewall.enable = true;
  system.stateVersion = "24.11"; # Did you read the comment?
  };
}
