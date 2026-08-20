{ ... }: {

  perSystem = {pkgs, ...}: {
    packages.wallpaper = pkgs.writeShellApplication {
      name = "wallpaper";
      runtimeInputs = [ pkgs.awww pkgs.coreutils pkgs.findutils ];
      text = ''
        wallpapers=${./wallpapers}

        if ! awww query >/dev/null 2>&1; then
          awww-daemon &
          sleep 1
        fi

        while true; do
          img=$(find "$wallpapers" -type f | shuf -n1)
          awww img "$img" --transition-type random --transition-fps 60
          sleep 900
        done
      '';
    };
  };
}
