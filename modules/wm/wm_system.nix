{...}:
{
  # Enable bluetooth
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};
	services.blueman.enable = true;

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
