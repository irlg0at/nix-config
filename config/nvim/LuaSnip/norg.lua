return {
	require("luasnip").snippet(
		{ trig = "$$",
			dscr="Generate inline latex block for use within neorg",
			snippetType="autosnippet"
		},
		{ t("$|"),i(1),t("|$")} )
}
