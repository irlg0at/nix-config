{pkgs, lib, config,inputs, system, ...}:
let 
  pkgs-stable = import inputs.nixpkgs_stable {
    inherit system;
  };
in
{

	imports = [
    ../wm_system.nix
	];

	nixpkgs.overlays = [
		(final: prev: {
			dwl = (pkgs-stable.dwl.override {
				withCustomConfigH = true;
				configH = ./config.h;
			}).overrideAttrs (oldAttrs: {
				patches = [
					./patches/ipc.patch
					./patches/ipcpertag.patch
					./patches/pertag.patch
					./patches/gaps.patch
				];
			});
		})
	];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      wlroots = {
        default = ["gtk"];
        "org.freedesktop.impl.portal.Screenshot"=["wlr"];
        "org.freedesktop.impl.portal.ScreenCast"=["wlr"];
      };
    };
  };


	environment.systemPackages = [
		pkgs.dwl
		(pkgs.writeScriptBin "launch_dwm.sh" ''
		#!/bin/sh
		# Make Java apps run fine
		wmname LG3D &

    export XDG_CURRENT_DESKTOP=wlroots 
    export XDG_SESSION_TYPE=wayland
    export XDG_SESSION_DESKTOP=wlroots

		# Start dunst
		dunst & 
    
    sleep 0.5

		# Kanshi to manage displays
		kanshi &
    
		# # Start insync and check if expired
		# insync start --no-daemon &

		# Start wallpaper daemon
		swww-daemon &
    exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots 

		'')
		pkgs.alsa-utils
		pkgs.wl-clipboard
		pkgs.waylock
		pkgs.bluetui
	];

	environment.etc = { 

    "xdg-desktop-portal-wlr/config".text = ''
    [screencast]
    chooser_type=dmenu
    chooser_cmd=fuzzel --dmenu
    '';
  } // lib.mkIf config.services.displayManager.ly.enable {
		"ly/sessions/dwl.desktop".text = ''
			  [Desktop Entry]
        Name=dwl
        Comment=dwm for Wayland
        Exec=dwl -s launch_dwm.sh
        Type=Application
		'';
  };
  
  environment.variables = {
    XDG_CURRENT_DESKTOP="wlroots";
    XDG_SESSION_TYPE="wayland";
    XDG_SESSION_DESKTOP="wlroots";
    _JAVA_AWT_WM_NONREPARENTING=1;
    XCURSOR_THEME="Dracula-cursors";
  };
}


