{ pkgs, ...}:
{
		programs.fish = {
			enable = true;

			plugins = [
				{name = "pure"; src = pkgs.fishPlugins.pure.src;}
			];

			shellAliases = {
				cd = "z";
				cat = "bat --theme=Dracula";
			};
		};

		programs.zoxide = {
			enable = true;
			enableFishIntegration = true;
		};

		programs.bat.enable = true;

	programs.bash = {
		enable = true;
	 initExtra = ''
	   if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
	   then
	     shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
	     exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
	   fi
	 '';
	};
}
