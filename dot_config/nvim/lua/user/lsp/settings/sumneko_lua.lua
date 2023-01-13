return {
	settings = {

		Lua = {
			diagnostics = {
				globals = {
					"vim",
					"s",
					"sn",
					"isn",
					"t",
					"i",
					"f",
					"c",
					"d",
					"r",
					"events",
					"ai",
					"extras",
					"l",
					"rep",
					"p",
					"m",
					"n",
					"dl",
					"fmt",
					"fmta",
					"conds",
					"postfix",
					"types",
					"parse",
				},
			},

			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
