{ ... }:
{
  flake.nixosModules.macbookproConfig = { pkgs, ... }: {
    services.upower.enable = true;

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
