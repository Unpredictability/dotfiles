-- vim.g.vimtex_enabled = 1
-- vim.cmd([[let g:vimtex_compiler_method = 'latexmk']])
-- vim.g.vimtex_compiler_enabled = 1
-- vim.g.vimtex_complete_enabled = 0
vim.g.vimtex_imaps_enabled = 0
vim.g.vimtex_indent_enabled = 0
vim.g.vimtex_mappings_disable = {}
vim.g.vimtex_matchparen_enabled = 0
vim.g.vimtex_quickfix_enabled = 1
vim.g.vimtex_view_enabled = 1
vim.g.vimtex_compiler_latexmk = {
	build_dir = "",
	callback = 1,
	continuous = 0,
	executable = "latexmk",
	hooks = {},
	options = {
		"-verbose",
		"-file-line-error",
		"-synctex=1",
		"-interaction=nonstopmode",
	},
}
vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"<leader>w",
	"<cmd>lua vim.lsp.buf.format()<CR><cmd>w<CR><cmd>VimtexCompileSS<CR>",
	{}
)
