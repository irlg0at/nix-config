{pkgs, lib, config, ...}:
{

	imports = [
	];

	environment.systemPackages = [
    (pkgs.dwl.override {
      conf = ./config.h;
    })
	];

	environment.etc = lib.mkIf config.services.displayManager.ly.enable {
		"ly/sessions/dwl.desktop".text = ''
			  [Desktop Entry]
        Name=dwl
        Comment=dwm for Wayland
        Exec=dwl
        Type=Application
		'';
	};

	security.polkit.enable = true;
	hardware.graphics = {
		enable = true;
	};


}


