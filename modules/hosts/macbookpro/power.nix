{ ... }:
{
  flake.nixosModules.macbookproConfig = { pkgs, ... }: {
    powerManagement.powertop.enable = true;
    services.upower.enable = true;

    services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="3297", ATTR{power/control}="on"
    '';

    systemd.services.usb-no-autosuspend = {
      description = "Keep input devices out of USB autosuspend";
      wantedBy = [ "multi-user.target" ];
      after = [ "powertop.service" ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = pkgs.writeShellScript "usb-no-autosuspend" ''
          for f in /sys/bus/usb/devices/*/idVendor; do
            read -r v < "$f" || continue
            if [ "$v" = "3297" ]; then
              echo on > "''${f%/idVendor}/power/control"
            fi
          done
        '';
      };
    };

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
