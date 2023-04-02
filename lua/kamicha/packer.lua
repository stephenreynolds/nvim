-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer: Package manager for Neovim.
  use 'wbthomason/packer.nvim'

  -- vim-closer: Automatically closes brackets.
  use 'rstacruz/vim-closer'

  -- Telescope: Highly extendable fuzzy finder.
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- tokyonight: A theme that celebrates the lights of Downtown Tokyo at night.
  use({
	  'folke/tokyonight.nvim',
	  as = 'tokyonight',
	  config = function()
		  vim.cmd('colorscheme tokyonight-night')
	  end
  })

  -- nvim-treesitter: Treesitter confiurations and abstraction layer.
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Treesitter Playground: View treesitter information.
  use('nvim-treesitter/playground')

  -- Harpoon: Getting you where you want with the fewest keystrokes.
  use('ThePrimeagen/harpoon')

  -- undotree: Undo history visualizer.
  use('mbbill/undotree')

  -- vim-fugitive: Git wrapper
  use('tpope/vim-fugitive')

  -- lsp-zero: Easy setup of LSP.
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- Which Key: Popup that displays possible key bindings of the command you started typing.
  use ("folke/which-key.nvim")

  -- lualine: A status bar
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- nvim-web-devicons: Useful icons
  use('nvim-tree/nvim-web-devicons')

  -- bufferline: A buffer line with tabpage integration.
  -- use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- null-ls: Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
          require("null-ls").setup()
      end,
      requires = { "nvim-lua/plenary.nvim" },
  })

  -- alpha: A fast and fully programmable greeter for neovim.
  use {
      'goolord/alpha-nvim',
      requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- gitsigns: Super fast git decorations.
  use {
      'lewis6991/gitsigns.nvim',
  }

  use {"akinsho/toggleterm.nvim", tag = '*'}

  -- GitHub Copilot
  use {'github/copilot.vim'}

  -- peek: Markdown preview
  use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })
end)
