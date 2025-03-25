{config, pkgs, lib, ...}:

{
	imports = [./programs/neovim.nix];
	nix.settings.experimental-features = ["nix-command" "flakes"];
}
