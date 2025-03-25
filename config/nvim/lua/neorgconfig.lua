require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {
			config = {
				icon_preset = "diamond"
			}
		},
		["core.latex.renderer"] = {
			config = {
				conceal = true,
				render_on_enter = false
			},
		},
		["core.integrations.image"] = {},
		["core.export"] = {},
		["core.export.markdown"] = {}
		}
})
