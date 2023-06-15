-- Catppuccin: Soothing pastel theme for (Neo)vim.
return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		flavour = "mocha",
		transparent_background = true,
		integrations = {
			alpha = true,
			gitsigns = true,
			harpoon = true,
			markdown = true,
			mason = true,
			noice = true,
			cmp = true,
			dap = {
				enabled = true,
				enable_ui = true,
			},
			fidget = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
			neotest = true,
			notify = true,
			overseer = true,
			semantic_tokens = true,
			treesitter = true,
			treesitter_context = true,
			telescope = true,
			lsp_trouble = true,
			which_key = true,
		},
	},
	config = function(_, opts)
		local catppuccin = require("catppuccin")
		catppuccin.setup(opts)
		catppuccin.compile()
        vim.cmd([[colorscheme catppuccin]])
	end,
}
