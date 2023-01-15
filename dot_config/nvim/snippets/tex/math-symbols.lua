require("user.tex_utils")

return {
	s({
		trig = "(sin|cos|tan|csc|sec|cot|arcsin|arccos|arctan|arccot|ln|log|exp|pi|int)",
		regTrig = true,
		snippetType = "autosnippet",
	}, {
		t("\\"),
		f(function(_, snip)
			return snip.captures[1]
		end, {}),
	}, { condition = in_mathzone }),
	s({
		trig = "(cap|cup|Cap|Cup|inf|sup)",
		regTrig = true,
		snippetType = "autosnippet",
	}, {
		t("\\"),
		f(function(_, snip)
			return snip.captures[1]
		end, {}),
	}, { condition = in_mathzone }),
	s({ trig = ";a", snippetType = "autosnippet" }, t("\\alpha"), { condition = in_mathzone }),
	s({ trig = ";b", snippetType = "autosnippet" }, t("\\beta"), { condition = in_mathzone }),
	s({ trig = ";c", snippetType = "autosnippet" }, t("\\gamma"), { condition = in_mathzone }),
	s({ trig = ";C", snippetType = "autosnippet" }, t("\\Gamma"), { condition = in_mathzone }),
	s({ trig = ";d", snippetType = "autosnippet" }, t("\\delta"), { condition = in_mathzone }),
	s({ trig = ";D", snippetType = "autosnippet" }, t("\\Delta"), { condition = in_mathzone }),
	s({ trig = ";e", snippetType = "autosnippet" }, t("\\epsilon"), { condition = in_mathzone }),
	s({ trig = ";n", snippetType = "autosnippet" }, t("\\eta"), { condition = in_mathzone }),

	s({ trig = "NN", snippetType = "autosnippet" }, t("\\mathbf{N}"), { condition = in_mathzone }),
	s({ trig = "ZZ", snippetType = "autosnippet" }, t("\\mathbf{Z}"), { condition = in_mathzone }),
	s({ trig = "QQ", snippetType = "autosnippet" }, t("\\mathbf{Q}"), { condition = in_mathzone }),
	s({ trig = "RR", snippetType = "autosnippet" }, t("\\mathbf{R}"), { condition = in_mathzone }),
	s({ trig = "CC", snippetType = "autosnippet" }, t("\\mathbf{C}"), { condition = in_mathzone }),
}
