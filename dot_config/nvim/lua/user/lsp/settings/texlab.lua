return {
	settings = {
		texlab = {
			auxDirectory = ".",
			bibtexFormatter = "texlab",
			build = {
				args = { "-pdfxe", "-interaction=nonstopmode", "-synctex=1", "-file-line-error", "-verbose" }, --, "%f"
				executable = "latexmk",
				forwardSearchAfter = false,
				onSave = true,
			},
			chktex = {
				onEdit = true,
				onOpenAndSave = true,
			},
			diagnosticsDelay = 300,
			formatterLineLength = 80,
			forwardSearch = {
				args = { "%l", "%p", "%f" },
				executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
			},
			latexFormatter = "latexindent",
			latexindent = {
				modifyLineBreaks = true,
			},
		},
	},
}
