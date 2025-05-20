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
		
		# yambar
		yambar &
		
		# Start dunst
		dunst & 

		# Kanshi to manage displays
		kanshi &
		
		# Start insync and check if expired
		insync start --no-daemon &
		
		# Sleep for both insync and kanshi
		sleep 0.5

		if insync error list | grep -q "expired"; then
    	dunstify --appname=Insync -u critical "Insync account expired" "Open Insync and login"
		fi

		# Start wallpaper daemon
		swww-daemon &

		tee ~/.cache/dwltags
		'')
		pkgs.alsa-utils
		pkgs.wl-clipboard
		pkgs.waylock
		pkgs.bluetui
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
	security.pam.services.waylock = {};
	
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	programs.xwayland.enable = true;

	# Enable bluetooth
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};
	services.blueman.enable = true;
}


