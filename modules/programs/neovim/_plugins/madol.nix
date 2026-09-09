{pkgs, ... }:

let 
    madol = pkgs.vimUtils.buildVimPlugin {
    name = "madol";
    src = pkgs.fetchFromGitLab {
      owner = "repetitivesin";
      repo = "madol.nvim";
      rev = "4ca92e301da283f5d9b63e8a0fed820845e2006d";
      hash = "sha256-T4MGV0V/cEXJkFO6KRt/qiw60iwRg+ner5JTXvz061k=";
      };
    };
in
{
      extraPlugins = [
        madol
      ];
}
