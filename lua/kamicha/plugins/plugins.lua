return {
	-- vim-closer: Automatically closes brackets.
	"rstacruz/vim-closer",

	-- telescope-fzf-native:  FZF sorter for telescope written in c
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- telescope-file-browser: A file browser extension for telescope.nvim.
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		event = "VeryLazy",
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	},

	-- telescope-frecency: Frecency/MRU for telescope.
	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "kkharji/sqlite.lua" },
	},

	-- nvim-treesitter-context: Context aware code folding.
	"nvim-treesitter/nvim-treesitter-context",

	-- Treesitter Playground: View treesitter information.
	"nvim-treesitter/playground",

	-- vim-commentary: Comment stuff out.
	"tpope/vim-commentary",

	-- nvim-web-devicons: Useful icons
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},

	-- gitsigns: Super fast git decorations.
	"lewis6991/gitsigns.nvim",

	{ "MunifTanjim/nui.nvim", lazy = true },

	-- glow: Markdown previewer
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},

	-- Neotest: A framework for interacting with tests within NeoVim.
	{
		"nvim-neotest/neotest",
		depencencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	},

	-- guess-indent: Guess indent settings.
	"nmac427/guess-indent.nvim",

	-- dressing.nvim: Neovim plugin to improve the default vim.ui interfaces
	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	-- yuck.vim: Support for eww configuration language yuck
	{ "elkowar/yuck.vim", enabled = false },
}
