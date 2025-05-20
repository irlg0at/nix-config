{  ... }:
{
	programs.nixvim = {
    plugins = {
      image = {
        enable = true;
				settings = {
					backend = "kitty";
					integrations = {
						markdown = {
							only_render_image_at_cursor = true;
							floating_windows = true;
						};
					};
				};
      };
    };
	};
}
