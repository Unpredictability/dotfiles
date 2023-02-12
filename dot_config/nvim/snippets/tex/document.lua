require("user.tex_utils")

table_node = function(args)
	local tabs = {}
	local count
	table = args[1][1]:gsub("%s", ""):gsub("|", "")
	count = #table
	for j = 1, count do
		local iNode
		iNode = i(j)
		tabs[2 * j - 1] = iNode
		if j ~= count then
			tabs[2 * j] = t(" & ")
		end
	end
	return sn(nil, tabs)
end

rec_table = function()
	return sn(nil, {
		c(1, {
			t({ "" }),
			sn(nil, { t({ "\\\\", "" }), d(1, table_node, { ai[1] }), d(2, rec_table, { ai[1] }) }),
		}),
	})
end

return {
	s({ trig = "doc" }, { c(1, { t("nothing"), t("passed!") }) }),

	s(
		{ trig = "beg", wordTRig = true, regTrig = false, snippetType = "autosnippet" },
		fmta(
			[[
		\begin{<>} 
			<>
		\end{<>}
			]],
			{ i(1, "document"), i(0), rep(1) }
		),
		{ condition = conds.line_begin }
	),

	s(
		{ trig = "enum", wordTRig = true, regTrig = false, snippetType = "autosnippet" },
		fmta(
			[[
		\begin{enumerate} 
			\item <>
		\end{enumerate}
			]],
			{ i(0) }
		),
		{ condition = conds.line_begin }
	),

	s(
		{ trig = "item", wordTRig = true, regTrig = false, snippetType = "autosnippet" },
		fmta(
			[[
		\begin{itemize} 
			\item <>	
		\end{itemize}
			]],
			{ i(0) }
		),
		{ condition = conds.line_begin }
	),
	s({ trig = "<>", snippetType = "autosnippet" }, t("\\item "), { condition = in_itemize }),
	s({ trig = "<>", snippetType = "autosnippet" }, t("\\item "), { condition = in_enumerate }),

	s(
		{ trig = "desc", wordTRig = true, regTrig = false, snippetType = "autosnippet" },
		fmta(
			[[
		\begin{description}
			\item[<>] <>
		\end{description}
			]],
			{ i(1, "Step 1"), i(0) }
		),
		{ condition = conds.line_begin }
	),
	s(
		{ trig = "<>", snippetType = "autosnippet" },
		fmta("\\item[<>] <>", { i(1), i(0) }),
		{ condition = in_description }
	),

	s(
		{ trig = "prob", wordTRig = true, regTrig = false, snippetType = "autosnippet" },
		fmta(
			[[
		\begin{problem} 
			<>
		\end{problem}
			]],
			{ i(0) }
		),
		{ condition = conds.line_begin }
	),

	s("#", fmta("\\section{<>}\n<>", { i(1, "Exercise"), i(0) }), { condition = conds.line_begin }),
	s("#*", fmta("\\section*{<>}\n<>", { i(1, "Exercise"), i(0) }), { condition = conds.line_begin }),
	s("##", fmta("\\subsection{<>}\n<>", { i(1, "Exercise"), i(0) }), { condition = conds.line_begin }),
	s("##*", fmta("\\subsection*{<>}\n<>", { i(1, "Exercise"), i(0) }), { condition = conds.line_begin }),
	s("###", fmta("\\subsubsection{<>}\n<>", { i(1, "Exercise"), i(0) }), { condition = conds.line_begin }),
	s("###*", fmta("\\subsubsection*{<>}\n<>", { i(1, "Exercise"), i(0) }), { condition = conds.line_begin }),

	s("tbl", {
		t("\\begin{tabular}{"),
		i(1, "0"),
		t({ "}", "" }),
		d(2, table_node, { 1 }, {}),
		d(3, rec_table, { 1 }),
		t({ "", "\\end{tabular}" }),
	}),
}
