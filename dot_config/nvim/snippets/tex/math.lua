require("user.tex_utils")

return {
	s("hi", { t("in math passed") }, { condition = in_mathzone }),

	-- Environments
	s(
		{ trig = "mm", snippetType = "autosnippet", wordTrig = true },
		fmta("$<>$ <>", { i(1), i(0) }),
		{ condition = in_text }
	),
	s(
		{ trig = "sm", snippetType = "autosnippet", wordTrig = true },
		fmta("$\\displaystyle <>$ <>", { i(1), i(0) }),
		{ condition = in_text }
	),
	s(
		{ trig = "dm", snippetType = "autosnippet", wordTrig = true },
		fmta(
			[[
			\[
				<>
			\]
			<>
			]],
			{ i(1), i(0) }
		),
		{ condition = in_text }
	),
	s(
		{ trig = "ali", snippetType = "autosnippet", wordTrig = true },
		fmta(
			[[
			\begin{<>}
				<>
			\end{<>}
			]],
			{ c(1, { t("align*"), t("align") }), i(0), rep(1) }
		),
		{ condition = conds.line_begin }
	),

	-- Fractions
	postfix({ trig = "//", match_pattern = "[%w%.%_%-%+%)%(%d]+$", snippetType = "autosnippet" }, {
		t("\\frac{"),
		f(function(_, parent)
			return parent.snippet.env.POSTFIX_MATCH
		end, {}),
		t("}{"),
		i(1),
		t("} "),
		i(0),
	}, { condition = in_mathzone }),
	s(
		{ trig = "frac", snippetType = "autosnippet", wordTrig = false },
		fmta("\\frac{<>}{<>} <>", { i(1), i(2), i(0) }),
		{ condition = in_mathzone }
	),

	-- Makeup
	s(
		{ trig = "td", wordTrig = false, snippetType = "autosnippet" },
		fmta("^{<>} <>", { i(1, "2"), i(0) }),
		{ condition = in_mathzone }
	),
	s({ trig = "([%)%(%\\A-Za-z]+)(%d)", regTrig = true, wordTrig = true, snippetType = "autosnippet" }, {
		f(function(_, snip)
			return snip.captures[1]
		end, {}),
		t("_"),
		f(function(_, snip)
			return snip.captures[2]
		end, {}),
	}, { condition = in_mathzone }),
	s({ trig = "([%)%(%\\A-Za-z]+)_(%d)(%d)", regTrig = true, wordTrig = true, snippetType = "autosnippet" }, {
		f(function(_, snip)
			return snip.captures[1]
		end, {}),
		t("_{"),
		f(function(_, snip)
			return snip.captures[2]
		end, {}),
		f(function(_, snip)
			return snip.captures[3]
		end, {}),
		t("}"),
	}, { condition = in_mathzone }),
	s(
		{ trig = "__", wordTrig = false, snippetType = "autosnippet" },
		fmta("_{<>} <>", { i(1), i(0) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "__", wordTrig = false, snippetType = "autosnippet" },
		fmta("_{<>} <>", { i(1), i(0) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "conj", wordTrig = false, snippetType = "autosnippet" },
		fmta("\\overline{<>} <>", { i(1), i(0) }),
		{ condition = in_mathzone }
	),
	postfix(
		{ trig = "bar", match_pattern = "[%w%.%_%-%+%)%(%d]+$", snippetType = "autosnippet" },
		fmta("\\bar{<>} <>", {
			f(function(_, parent)
				return parent.snippet.env.POSTFIX_MATCH
			end, {}),
			i(0),
		}),
		{ condition = in_mathzone }
	),
	postfix(
		{ trig = "hat", match_pattern = "[%w%.%_%-%+%)%(%d]+$", snippetType = "autosnippet" },
		fmta("\\hat{<>} <>", {
			f(function(_, parent)
				return parent.snippet.env.POSTFIX_MATCH
			end, {}),
			i(0),
		}),
		{ condition = in_mathzone }
	),

	-- Relations
	s({ trig = ">>", wordTrig = false, snippetType = "autosnippet" }, t("\\gg"), { condition = in_mathzone }),
	s({ trig = "<<", wordTrig = false, snippetType = "autosnippet" }, t("\\ll"), { condition = in_mathzone }),
	s({ trig = "~~", wordTrig = false, snippetType = "autosnippet" }, t("\\sim"), { condition = in_mathzone }),

	-- Big Operators
	s(
		{ trig = "iint", wordTrig = true, snippetType = "autosnippet" },
		fmta("\\int <> \\mathrm{d} <> <>", { i(1, "f(x)"), i(2, "x"), i(0) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "dint", wordTrig = true, snippetType = "autosnippet" },
		fmta(
			"\\int_{<>}^{<>} <> \\mathrm{d} <> <>",
			{ i(1, "-\\infty"), i(2, "\\infty"), i(3, "f(x)"), i(4, "x"), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "sum", wordTrig = true },
		fmta("\\sum_{<>=<>}^{<>} <>", { i(1, "n"), i(2, "1"), i(3, "\\infty"), i(0, "a_n z^n") }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "prod", wordTrig = true },
		fmta("\\prod_{<>=<>}^{<>} <>", { i(1, "n"), i(2, "1"), i(3, "\\infty"), i(0, "a_n z^n") }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lim", wordTrig = true },
		fmta("\\lim_{<> \\to <>} <>", { i(1, "n"), i(2, "\\infty"), i(0, "a_n") }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "limsup", wordTrig = true },
		fmta("\\limsup_{<> \\to <>} <>", { i(1, "n"), i(2, "\\infty"), i(0, "a_n") }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "liminf", wordTrig = true },
		fmta("\\liminf_{<> \\to <>} <>", { i(1, "n"), i(2, "\\infty"), i(0, "a_n") }),
		{ condition = in_mathzone }
	),

	-- logics
	s({ trig = "=>", snippetType = "autosnippet", wordTrig = false }, t("\\implies"), { condition = in_mathzone }),
	s({ trig = "=<", snippetType = "autosnippet", wordTrig = false }, t("\\impliedby"), { condition = in_mathzone }),
	s({ trig = "iff", snippetType = "autosnippet", wordTrig = false }, t("\\iff"), { condition = in_mathzone }),
	s({ trig = "!=", snippetType = "autosnippet", wordTrig = false }, t("\\neq"), { condition = in_mathzone }),
	s({ trig = "->", snippetType = "autosnippet", wordTrig = false }, t("\\to"), { condition = in_mathzone }),
	s(
		{ trig = "<->", snippetType = "autosnippet", wordTrig = false },
		t("\\leftrightarrow"),
		{ condition = in_mathzone }
	),
	s({ trig = "inn", snippetType = "autosnippet", wordTrig = false }, t("\\in"), { condition = in_mathzone }),
	s({ trig = "nin", snippetType = "autosnippet", wordTrig = false }, t("\\notin"), { condition = in_mathzone }),

	-- Delimiters
	s(
		{ trig = "ceil", wordTrig = false, snippetType = "autosnippet" },
		fmta("\\left\\lceil <> \\right\\rceil <>", { i(1), i(0) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "floor", wordTrig = false, snippetType = "autosnippet" },
		fmta("\\left\\lfloor <> \\right\\rfloor <>", { i(1), i(0) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "()", wordTrig = false, snippetType = "autosnippet" },
		fmta("\\left( <> \\right) <>", { i(1), i(0) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lrb", wordTrig = false, snippetType = "autosnippet" },
		fmta("\\left( <> \\right) <>", { i(1), i(0) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lrs", wordTrig = false, snippetType = "autosnippet" },
		fmta("\\left[ <> \\right] <>", { i(1), i(0) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lrc", wordTrig = false, snippetType = "autosnippet" },
		fmta("\\left\\{ <> \\right\\} <>", { i(1), i(0) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lrl", wordTrig = false, snippetType = "autosnippet" },
		fmta("\\left| <> \\right| <>", { i(1), i(0) }),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "lra", wordTrig = false, snippetType = "autosnippet" },
		fmt("\\left< {} \\right> {}", { i(1), i(0) }),
		{ condition = in_mathzone }
	),
}
