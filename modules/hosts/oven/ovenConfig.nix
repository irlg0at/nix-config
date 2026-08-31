{...}: {
  flake.nixosModules.ovenConfig = {pkgs, ...}: {

  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 3;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "oven"; # Define your hostname.

  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openconnect
    ];
  };

  
  # Enables VM-ware workstation to work
  # virtualisation.vmware.host.enable = true; 
  };
}
