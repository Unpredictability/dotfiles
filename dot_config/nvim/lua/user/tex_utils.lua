TEX_UTILS = {}

TEX_UTILS.in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

TEX_UTILS.in_text = function()
	return not TEX_UTILS.in_mathzone()
end

TEX_UTILS.in_comment = function()
	return vim.fn["vimtex#syntax#in_comment"]() == 1
end

TEX_UTILS.in_env = function(name)
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end

TEX_UTILS.in_equation = function()
	return TEX_UTILS.in_env("equation")
end

TEX_UTILS.in_itemize = function()
	return TEX_UTILS.in_env("itemize")
end

TEX_UTILS.in_enumerate = function()
	return TEX_UTILS.in_env("itemize")
end

TEX_UTILS.in_tikz = function()
	return TEX_UTILS.in_env("tikzpicture")
end

return {}
