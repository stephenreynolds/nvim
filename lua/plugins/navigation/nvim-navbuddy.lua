return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim",
        "numToStr/Comment.nvim",
        "nvim-telescope/telescope.nvim",
	},
    lazy = false,
	opts = {
		lsp = {
			auto_attach = true,
		},
	},
	keys = {
		{
			"<leader>ls",
			"<cmd>Navbuddy<cr>",
			desc = "Symbol outline",
		},
	},
}
