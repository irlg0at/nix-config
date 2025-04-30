{pkgs, inputs,  self, ...}:

{
	imports = [
	inputs.home-manager.nixosModules.home-manager
	];

	home-manager = {
		extraSpecialArgs = { inherit inputs self; };
		users = {
		g0at = import ./home.nix;
		};
	};


	nix.settings.experimental-features = ["nix-command" "flakes"];
 	programs.fish.enable = true;
	nixpkgs.config.allowUnfree = true;

  virtualisation.docker.enable = true;
	users.users.g0at.extraGroups = [ "docker" ];

	  environment.systemPackages = with pkgs; [
		(python3.withPackages (ps: with ps; [
			pwntools
			pycryptodome
  ]))
		wireguard-tools
  ];

	services.pcscd.enable = true;
	programs.gnupg.agent = {
		enable = true;
	};






}
