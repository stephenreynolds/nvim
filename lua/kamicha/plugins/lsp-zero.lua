-- lsp-zero: Easy setup of LSP.
return {
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
	config = function()
		local lsp = require("lsp-zero")

		lsp.preset("recommended")

		lsp.ensure_installed({
			"tsserver",
			"eslint",
			"lua_ls",
			"rust_analyzer",
			"clangd",
		})

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
		})

		lsp.set_preferences({
			sign_icons = {},
		})

		lsp.setup_nvim_cmp({
			mapping = cmp_mappings,
		})

		lsp.on_attach(function(_, bufnr)
			vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { buffer = bufnr, remap = false, desc = "Info" })
			vim.keymap.set("n", "<leader>lf", function()
				vim.lsp.buf.format()
			end, { buffer = bufnr, remap = false, desc = "Format" })
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, { buffer = bufnr, remap = false, desc = "Go to definition" })
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, { buffer = bufnr, remap = false, desc = "Hover" })
			vim.keymap.set("n", "<leader>ld", function()
				vim.diagnostic.open_float()
			end, { buffer = bufnr, remap = false, desc = "Open diagnostics popup" })
			vim.keymap.set("n", "<leader>[d", function()
				vim.diagnostic.goto_prev()
			end, { buffer = bufnr, remap = false, desc = "Go to previous diagnostic" })
			vim.keymap.set("n", "<leader>]d", function()
				vim.diagnostic.goto_next()
			end, { buffer = bufnr, remap = false, desc = "Go to next diagnostic" })
			vim.keymap.set("n", "<leader>la", function()
				vim.lsp.buf.code_action()
			end, { buffer = bufnr, remap = false, desc = "Code action" })
			vim.keymap.set("n", "<leader>ll", function()
				vim.lsp.codelens.run()
			end, { buffer = bufnr, remap = false, desc = "CodeLens" })
			vim.keymap.set("n", "<leader>lrn", function()
				vim.lsp.buf.rename()
			end, { buffer = bufnr, remap = false, desc = "Rename symbol" })
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, { buffer = bufnr, remap = false, desc = "Signature help" })
		end)

		lsp.setup()
	end,
}
