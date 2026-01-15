{ pkgs, ... }:
let
  excalidraw = pkgs.vimUtils.buildVimPlugin {
    name = "excalidraw";
    dependencies = with pkgs.vimPlugins; [ telescope-nvim ];
    src = pkgs.fetchFromGitHub {
      owner = "marcocofano";
      repo = "excalidraw.nvim";
      rev = "0d1babd50e6dd3e41359df03946d0e4d1c7f1f5f";
      sha256 = "sha256-oywEaz8Cm9eOb3d0nIlimm+bq/IioEpIAxeo7n0+UVc=";
    };
    checkPhase = ":";
  };
in
{
  programs.firefox.nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
  programs.firefoxpwa = {
    enable = true;
  };

	programs.nixvim = {
    extraPlugins = [excalidraw];
  };
}
