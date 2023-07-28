return {
	"loqusion/true-zen.nvim",
	branch = "some-fixes",
	opts = {
		modes = {
			narrow = {
				folds_style = "invisible",
			},
			minimalist = {
				options = {
					list = false,
					statusline = "%#Normal#",
				},
			},
		},
	},
	keys = {
		{
			"<leader>zz",
			"<cmd>TZAtaraxis<cr>",
			silent = true,
			noremap = true,
			desc = "Toggle zen mode",
		},
		{
			"<leader>zn",
			"<cmd>TZNarrow<cr>",
			silent = true,
			noremap = true,
			desc = "Narrow near line",
		},
		{
			"<leader>zn",
			"<cmd>'<,'>TZNarrow<cr>",
			silent = true,
			noremap = true,
			mode = "v",
			desc = "Narrow selection",
		},
		{
			"<leader>zf",
			"<cmd>TZFocus<cr>",
			silent = true,
			noremap = true,
			desc = "Focus current window",
		},
		{
			"<leader>zm",
			"<cmd>TZMinimalist<cr>",
			silent = true,
			noremap = true,
			desc = "Hide UI",
		},
	},
}
