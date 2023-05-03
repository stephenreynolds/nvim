vim.keymap.set("n", "<leader>pc", "<cmd>PackerCompile<cr>", { desc = "Compile" })
vim.keymap.set("n", "<leader>pi", "<cmd>PackerInstall<cr>", { desc = "Install" })
vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "Sync" })
vim.keymap.set("n", "<leader>pS", "<cmd>PackerStatus<cr>", { desc = "Status" })
vim.keymap.set("n", "<leader>pu", "<cmd>PackerUpdate<cr>", { desc = "Update" })

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Packer: Package manager for Neovim.
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	-- vim-closer: Automatically closes brackets.
	use("rstacruz/vim-closer")

	-- Telescope: Highly extendable fuzzy finder.
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- telescope-file-browser: A file browser extension for telescope.nvim.
	use({
		"nvim-telescope/telescope-file-browser.nvim",
        config = function()
            require("telescope").load_extension("file_browser")
        end,
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})

	-- telescope-frecency: Frecency/MRU for telescope.
	use({
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		requires = { "kkharji/sqlite.lua" },
	})

	-- auto-session: Automatically save and restore sessions.
	use({ "rmagatti/auto-session" })

	-- tokyonight: A theme that celebrates the lights of Downtown Tokyo at night.
	use({ "folke/tokyonight.nvim", as = "tokyonight" })

	-- Rosé Pine: All natural pine, faux fur and a bit of soho vibes for the classy minimalist.
	use({ "rose-pine/neovim", as = "rose-pine" })

	-- Kanagawa: NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.
	use({ "rebelot/kanagawa.nvim", as = "kanagawa" })

	-- Catppuccin: Soothing pastel theme for (Neo)vim.
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- nvim-treesitter: Treesitter confiurations and abstraction layer.
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- nvim-treesitter-context: Context aware code folding.
	use("nvim-treesitter/nvim-treesitter-context")

	-- Treesitter Playground: View treesitter information.
	use("nvim-treesitter/playground")

	-- Harpoon: Getting you where you want with the fewest keystrokes.
	use("ThePrimeagen/harpoon")

	-- git-worktree: Git worktree support for Neovim.
	use("ThePrimeagen/git-worktree.nvim")

	-- undotree: Undo history visualizer.
	use("mbbill/undotree")

	-- vim-commentary: Comment stuff out.
	use("tpope/vim-commentary")

	-- vim-fugitive: Git wrapper
	use("tpope/vim-fugitive")

	-- gv.vim: Git commit browser
	use("junegunn/gv.vim")

	-- lsp-zero: Easy setup of LSP.
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- nvim-dap-ui: Debugger interface
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- mason-nvim-dap: Automatically set up DAPs with Mason
	use("jay-babu/mason-nvim-dap.nvim")

	-- Which Key: Popup that displays possible key bindings of the command you started typing.
	use("folke/which-key.nvim")

	-- lualine: A status bar
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- nvim-web-devicons: Useful icons
	use("nvim-tree/nvim-web-devicons")

	-- bufferline: A buffer line with tabpage integration.
	-- use {"akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons"}

	-- null-ls: Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- alpha: A fast and fully programmable greeter for neovim.
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- gitsigns: Super fast git decorations.
	use({
		"lewis6991/gitsigns.nvim",
	})

	-- trouble: A pretty list of diagnostics.
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	})

	-- GitHub Copilot
	use({ "github/copilot.vim" })

	-- yuck.vim: Support for eww configuration language yuck
	use({ "elkowar/yuck.vim" })

	-- zen-mode: Distraction free writing.
	use({ "folke/zen-mode.nvim" })

	-- glow: Markdown previewer
	use({
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup()
		end,
	})

	use({
		"jackMort/ChatGPT.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})

	-- noice: Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})

	-- colorizer: A high-performance color highlighter.
	use({ "norcalli/nvim-colorizer.lua" })

	-- Neotest: A framework for interacting with tests within NeoVim.
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
