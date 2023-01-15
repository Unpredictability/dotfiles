in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

in_text = function()
	return not in_mathzone()
end

in_comment = function()
	return vim.fn["vimtex#syntax#in_comment"]() == 1
end

in_env = function(name)
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end

in_equation = function()
	return in_env("equation")
end

in_itemize = function()
	return in_env("itemize")
end

in_enumerate = function()
	return in_env("enumerate")
end

in_description = function()
	return in_env("description")
end

in_tikz = function()
	return in_env("tikzpicture")
end

-- return {}
