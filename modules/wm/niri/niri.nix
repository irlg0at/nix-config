{pkgs, lib, config, ...}:
{
	imports = [
    ../wm_system.nix
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
		pkgs.niri
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
  }  // lib.mkIf config.services.displayManager.ly.enable {
		"ly/sessions/niri.desktop".text = ''
			  [Desktop Entry]
		      Name=niri
		      Comment=dwm for Wayland
		      Exec=niri-session
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


