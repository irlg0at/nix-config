return {
	require("luasnip").snippet(
		{ trig = "$$",
			dscr="Generate a multiline latex block",
			snippetType="autosnippet"
		},
		{ t("\\[ "),i(1),t(" \\]")} )
}
