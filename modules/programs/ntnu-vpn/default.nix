{ moduleWithSystem, ... }:
{
  flake.nixosModules.ntnu-vpn = moduleWithSystem (
    { self', ... }:
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.openconnect
        self'.packages.ntnu-vpn
      ];
    }
  );

  perSystem =
    { pkgs, lib, ... }:
    {
      packages.ntnu-vpn = pkgs.writeShellApplication {
        name = "ntnu-vpn";
        runtimeInputs = [ pkgs.openconnect ];
        text = ''
          oc=${lib.getExe pkgs.openconnect}

          eval "$("$oc" --useragent='AnyConnect Linux' --authenticate vpn.ntnu.no)"

          echo "$COOKIE" | sudo "$oc" \
            --useragent='AnyConnect Linux' \
            --cookie-on-stdin \
            --servercert "$FINGERPRINT" \
            --resolve "$RESOLVE" \
            "$CONNECT_URL"
        '';
      };
    };
}
