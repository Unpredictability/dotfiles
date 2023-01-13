require("user.tex_utils")

table_node = function(args)
	local tabs = {}
	local count
	table = args[1][1]:gsub("%s", ""):gsub("|", "")
	count = table:len()
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

	s({ trig = "shit", snippetType = "autosnippet" }, fmt("ass{}hole", { i(0) })),

	s(
		{ trig = "beg", wordTRig = true, regTrig = false, snippetType = "autosnippet" },
		fmta(
			[[
		\begin{<>} 
			<>
		\end{<>}
			]],
			{ i(1), i(0), rep(1) }
		),
		{ condition = conds.line_begin }
	),

	s("tbl", {
		t("\\begin{tabular}{"),
		i(1, "0"),
		t({ "}", "" }),
		d(2, table_node, { 1 }, {}),
		d(3, rec_table, { 1 }),
		t({ "", "\\end{tabular}" }),
	}),
}
