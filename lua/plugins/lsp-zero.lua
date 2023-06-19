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
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"petertriho/cmp-git",
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
			"gopls",
			"golangci_lint_ls",
			"emmet_ls",
			"jsonls",
			"html",
			"marksman",
			"sqlls",
			"taplo",
			"tailwindcss",
			"yamlls",
			"dockerls",
			"docker_compose_language_service",
		})

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
			["<Tab>"] = cmp.mapping(function(fallback)
				-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
				if cmp.visible() then
					local entry = cmp.get_selected_entry()
					if not entry then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					else
						cmp.confirm()
					end
				else
					fallback()
				end
			end, { "i", "s", "c" }),
		})

		local lspkind = require("lspkind")

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" },
			}, {
				{ name = "buffer" },
			}),
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		lsp.set_preferences({
			sign_icons = {},
		})

		lsp.setup_nvim_cmp({
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					preset = "default",
					maxwidth = 50,
					ellipsis_char = "...",
					before = function(_, vim_item)
						return vim_item
					end,
				}),
			},
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
