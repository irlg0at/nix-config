{  ... }:
{
	programs.nixvim = {
    plugins = {
      mkdnflow = {
        enable = true;
				settings = {
					links = { create_on_follow_failure = false; };
				};
      };
    };
	};
}
