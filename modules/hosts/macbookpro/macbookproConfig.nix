{...}: {
  flake.nixosModules.macbookproConfig = {pkgs, ...}: {

  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 10;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "macbookpro"; # Define your hostname.

  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openconnect
    ];
  };

  services.kmonad = {
  enable = true;
     keyboards = {
       myKMonadOutput = {
         device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
         config = builtins.readFile ./programs/kmonad/config.kbd;
       };
     };
  };

	# systemd.services."promisc@" = {
	# 	description = "Set %i interface in promiscuous mode";
	# 	after = [ "network.target" ];
	# 	serviceConfig = {
	# 		Type = "oneshot";
	# 		ExecStart = "${pkgs.iproute2}/bin/ip link set dev %i promisc on";
	# 		RemainAfterExit = true;
	# 	};
	# };
  
  # Enables VM-ware workstation to work
  virtualisation.vmware.host.enable = true;
  # Enable fingerprint for sudo
  security.pam.services.sudo.fprintAuth = true;
  };
}
