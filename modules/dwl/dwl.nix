{pkgs, ...}:
{

	environment.systemPackages = [
    (pkgs.dwl.override {
      conf = ./config.h;
    })
	];

	security.polkit.enable = true;
	hardware.graphics = {
		enable = true;
	};
}


