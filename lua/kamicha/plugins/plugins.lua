return {
	-- plenary: A useful library of functions.
	"nvim-lua/plenary.nvim",

	-- vim-closer: Automatically closes brackets.
	"rstacruz/vim-closer",

	-- Telescope: Highly extendable fuzzy finder.
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.x",
		depencencies = { "nvim-lua/plenary.nvim" },
	},

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

	-- auto-session: Automatically save and restore sessions.
	"rmagatti/auto-session",

	-- nvim-treesitter: Treesitter confiurations and abstraction layer.
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- nvim-treesitter-context: Context aware code folding.
	"nvim-treesitter/nvim-treesitter-context",

	-- Treesitter Playground: View treesitter information.
	"nvim-treesitter/playground",

	-- Harpoon: Getting you where you want with the fewest keystrokes.
	{
		"ThePrimeagen/harpoon",
		depencencies = { "nvim-lua/plenary.nvim" },
	},

	-- git-worktree: Git worktree support for Neovim.
	"ThePrimeagen/git-worktree.nvim",

	-- undotree: Undo history visualizer.
	"mbbill/undotree",

	-- vim-commentary: Comment stuff out.
	"tpope/vim-commentary",

	-- vim-fugitive: Git wrapper
	"tpope/vim-fugitive",

	-- gv.vim: Git commit browser
	"junegunn/gv.vim",

	-- lsp-zero: Easy setup of LSP.
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			"neovim/nvim-lspconfig",
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			"williamboman/mason-lspconfig.nvim",
			-- Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			-- Snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	},

	-- nvim-dap-ui: Debugger interface
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		event = "VeryLazy",
	},

	-- mason-nvim-dap: Automatically set up DAPs with Mason
	"jay-babu/mason-nvim-dap.nvim",

	-- Which Key: Popup that displays possible key bindings of the command you started typing.
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},

	-- lualine: A status bar
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", optional = true },
		},
	},

	-- nvim-web-devicons: Useful icons
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},

	-- null-ls: Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
	{
		"jose-elias-alvarez/null-ls.nvim",
		depencencies = { "nvim-lua/plenary.nvim" },
	},

	-- alpha: A fast and fully programmable greeter for neovim.
	{
		"goolord/alpha-nvim",
		depencencies = { "nvim-tree/nvim-web-devicons" },
		event = "VimEnter",
	},

	-- gitsigns: Super fast git decorations.
	"lewis6991/gitsigns.nvim",

	-- trouble: A pretty list of diagnostics.
	{
		"folke/trouble.nvim",
		depencencies = { "nvim-tree/nvim-web-devicons" },
	},

	{ "MunifTanjim/nui.nvim", lazy = true },
	{ "rcarriga/nvim-notify", lazy = true },

	-- noice: Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
	{
		"folke/noice.nvim",
		depencencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		event = "VeryLazy",
	},

	-- GitHub Copilot
	"github/copilot.vim",

	-- ChatGPT.nvim: ChatGPT inside Neovim.
	{
		"jackMort/ChatGPT.nvim",
		depencencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		event = "VeryLazy",
	},

	-- zen-mode: Distraction free writing.
	"folke/zen-mode.nvim",

	-- glow: Markdown previewer
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},

	-- colorizer: A high-performance color highlighter.
	"norcalli/nvim-colorizer.lua",

	-- Neotest: A framework for interacting with tests within NeoVim.
	{
		"nvim-neotest/neotest",
		depencencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	},

	-- fidget.nvim: Standalone UI for nvim-lsp progress.
	{ "j-hui/fidget.nvim", tag = "legacy" },

	-- guess-indent: Guess indent settings.
	"nmac427/guess-indent.nvim",

	-- leap: Neovim's answer to the mouse.
	{
		"ggandor/leap.nvim",
		depencencies = { "tpope/vim-repeat" },
	},

	-- dressing.nvim: Neovim plugin to improve the default vim.ui interfaces
	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	-- overseer: A task runner and job management plugin for Neovim
	{
		"stevearc/overseer.nvim",
		depencencies = {
			{ "stevearc/dressing.nvim", optional = true },
			{ "nvim-telescope/telescope.nvim", optional = true },
			{ "rcarriga/nvim-notify", optional = true },
		},
	},

	-- neodev.nvim: Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
	"folke/neodev.nvim",

	-- yuck.vim: Support for eww configuration language yuck
	{ "elkowar/yuck.vim", enabled = false },

	-- Catppuccin: Soothing pastel theme for (Neo)vim.
	{ "catppuccin/nvim", name = "catppuccin", enabled = true, priority = 1000, lazy = false },

	-- tokyonight: A theme that celebrates the lights of Downtown Tokyo at night.
	{ "folke/tokyonight.nvim", name = "tokyonight", enabled = false, priority = 1000 },

	-- Rosé Pine: All natural pine, faux fur and a bit of soho vibes for the classy minimalist.
	{ "rose-pine/neovim", name = "rose-pine", enabled = false, priority = 1000 },

	-- Kanagawa: NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.
	{ "rebelot/kanagawa.nvim", name = "kanagawa", enabled = false, priority = 1000 },
}
