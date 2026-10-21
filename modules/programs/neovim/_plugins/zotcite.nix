{ pkgs, ... }:
{
  dependencies.sqlite.enable = true; 
  plugins = {
    zotcite = {
      enable = true;
      settings.key_type = "better-bibtex";
      package = (pkgs.vimPlugins.zotcite.overrideAttrs{
        version = "2026-10-04";
        src = pkgs.fetchFromGitHub {
            owner = "jalvesaq";
            repo = "zotcite";
            rev = "f57a5ebc67bd7768da1abd5ba270ec7426b32c6a";
            hash = "sha256-pK+sVsJU0ogMTRQjsFsdcTaDtemA0PwQYiB8NH0v8Ck=";
        };
      });
    };
  };
}
