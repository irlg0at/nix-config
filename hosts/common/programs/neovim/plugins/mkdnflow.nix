{  ... }:
{
	programs.nixvim = {
    plugins = {
      mkdnflow = {
        enable = true;
				extraOptions = {
					links = { create_on_follow_failure = false; };
				};
      };
    };
	};
}
