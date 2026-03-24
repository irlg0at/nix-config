{pkgs, ...}:
{

  home.packages = with pkgs; [
    ffmpeg
    puddletag
  ];

  programs.fish = {
    functions = {
      to_cover = "ffmpeg -i $argv[1] -vf scale=500:500 500_$argv[1]";
    };
  };
}
