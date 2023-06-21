return {
	"lukas-reineke/indent-blankline.nvim",
    event = {"BufRead", "BufWinEnter", "BufNewFile"},
	opts = {
		indentLine_enabled = 1,
		filetype_exclude = {
			"help",
			"terminal",
			"lazy",
			"lspinfo",
			"TelescopePrompt",
			"TelescopeResults",
			"mason",
            "alpha",
			"",
		},
		buftype_exclude = { "terminal" },
		show_trailing_blankline_indent = false,
		show_first_indent_level = false,
		show_current_context = true,
		show_current_context_start = false,
	},
}
