return {
	require("luasnip").snippet(
		{ trig = "$$",
			dscr="Generate inline latex block for use within md",
			snippetType="autosnippet"
		},
		{ t("$"),i(1),t("$")}
	),
}
