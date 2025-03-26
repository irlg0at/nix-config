{pkgs, ...}:
{

	environment.systemPackages = [
    (pkgs.dwl.override {
      conf = ./dwl/config.h;
    })
	];

	security.polkit.enable = true;
	hardware.opengl = {
		enable = true;
		driSupport = true;
	};
}


