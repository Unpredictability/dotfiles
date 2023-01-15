require("user.tex_utils")

matrix_node = function(args, parent)
	local x = parent.snippet.captures[1]
	local y = parent.snippet.captures[2]
	local mat = {}
	for k = 1, x do
		local row = {}
		for j = 1, y do
			table.insert(row, i(j))
			table.insert(row, t(" & "))
		end
		table.remove(row, 2 * y)
		table.insert(row, t(" \\\\"))

		table.insert(mat, sn(k, row))
		table.insert(mat, t({ "", "" }))
	end
	table.remove(mat, 2 * x)
	return sn(1, mat)
end

return {
	s(
		{ trig = "pmat_{(%d)(%d)}", regTrig = true, snippetType = "snippet" },
		fmta(
			[[
		\begin{pmatrix}
		<>
		\end{pmatrix}
		<>
		]],
			{
				d(1, matrix_node),
				i(0),
			}
		)
	),
	s(
		{ trig = "bmat_{(%d)(%d)}", regTrig = true, snippetType = "snippet" },
		fmta(
			[[
		\begin{bmatrix}
		<>
		\end{bmatrix}
		<>
		]],
			{
				d(1, matrix_node),
				i(0),
			}
		)
	),
	s(
		{ trig = "vmat_{(%d)(%d)}", regTrig = true, snippetType = "snippet" },
		fmta(
			[[
		\begin{vmatrix}
		<>
		\end{vmatrix}
		<>
		]],
			{
				d(1, matrix_node),
				i(0),
			}
		)
	),
}
