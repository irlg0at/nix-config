{pkgs, lib, config, ...}:
{

	imports = [
	];


	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};


	environment.systemPackages = [
    (pkgs.dwl.override {
      conf = ./config.h;
    })
		(pkgs.writeScriptBin "launch_dwm.sh" ''
		#!/bin/sh
		# Make Java apps run fine
		export _JAVA_AWT_WM_NONREPARENTING=1 &
		wmname LG3D &

		# Start wallpaper daemon
		swww-daemon &

		yambar &
		tee ~/.cache/dwltags
		'')
		pkgs.alsa-utils
	];

	environment.etc = lib.mkIf config.services.displayManager.ly.enable {
		"ly/sessions/dwl.desktop".text = ''
			  [Desktop Entry]
        Name=dwl
        Comment=dwm for Wayland
        Exec=dwl -s launch_dwm.sh
        Type=Application
		'';
	};

	security.polkit.enable = true;
	hardware.graphics = {
		enable = true;
	};


}


