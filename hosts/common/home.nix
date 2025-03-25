{ lib, pkgs, ... }: {
  home = {
    packages = with pkgs; [
			cowsay
    ];

    username = "g0at";
    homeDirectory = "/home/g0at";
    stateVersion = "24.11";
  };
}
