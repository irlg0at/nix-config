{pkgs, lib, config, ...}:
{

	imports = [
	];

	nixpkgs.overlays = [
		(final: prev: {
			dwl = (prev.dwl.override {
				withCustomConfigH = true;
				configH = ./config.h;
			}).overrideAttrs (oldAttrs: {
				patches = [
					./patches/vanitygaps-0.7.patch
				];
			});
		})
	];


	environment.systemPackages = [
		pkgs.dwl
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
		pkgs.wl-clipboard
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
	
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	programs.xwayland.enable = true;


}


