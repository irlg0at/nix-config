{ ... }:
{
  flake.nixosModules.macbookproConfig = { pkgs, ... }: {
    powerManagement.powertop.enable = true;
    services.upower.enable = true;

    services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="3297", ATTR{power/control}="on"
    '';

    systemd.services.battery-charge-limit = {
      description = "Limit battery charge to 80%";
      wantedBy = [ "multi-user.target" ];
      after = [ "multi-user.target" ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = pkgs.writeShellScript "battery-charge-limit" ''
          f=/sys/class/power_supply/BAT1/charge_control_end_threshold
          if [ -w "$f" ]; then echo 80 > "$f"; fi
        '';
      };
    };
  };
}
