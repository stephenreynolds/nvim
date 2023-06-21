return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	opts = {
		width = 120,
		disableOnLastBuffer = true,
		killAllBuffersOnDisable = true,
		autocmds = {
			enableOnVimEnter = true,
			enableOnTabEnter = true,
			reloadOnColorSchemeChange = true,
		},
	},
	keys = {
		{
			"<leader>zz",
			"<cmd>NoNeckPain<cr>",
			desc = "Center buffer",
		},
		{
			"<leader>zr",
			":NoNeckPainResize ",
			desc = "Resize buffer width",
		},
		{
			"<leader>zu",
			"<cmd>NoNeckPainWidthUp<cr>",
			desc = "Increase buffer width",
		},
		{
			"<leader>zd",
			"<cmd>NoNeckPainWidthDown<cr>",
			desc = "Decrease buffer width",
		},
	},
}
