vim.g.vimtex_enabled = 1
vim.cmd([[let g:vimtex_compiler_method = 'latexmk']])
vim.g.vimtex_compiler_enabled = 1
vim.g.vimtex_complete_enabled = 0
vim.g.vimtex_imaps_enabled = 0
vim.g.vimtex_indent_enabled = 0
vim.g.vimtex_mappings_disable = {}
vim.g.vimtex_matchparen_enabled = 0
vim.g.vimtex_quickfix_enabled = 1
vim.g.vimtex_view_enabled = 1
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk_engines = "xelatex"
vim.g.vimtex_compiler_latexmk = {
	-- build_dir = "",
	callback = 1,
	continuous = 1,
	executable = "latexmk",
	hooks = {},
	options = {
		-- "-xelatex",
		"-verbose",
		"-file-line-error",
		"-synctex=1",
		"-interaction=nonstopmode",
	},
}
