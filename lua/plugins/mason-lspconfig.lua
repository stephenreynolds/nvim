return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {
		ensure_installed = {
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
		},
		automatic_installation = true,
	},
	config = function(_, opts)
		local mason_lspconfig = require("mason-lspconfig")
		require("mason").setup()
		mason_lspconfig.setup(opts)

		local lspconfig = require("lspconfig")
		local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

		local default_on_attach = function(_, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { buffer = bufnr, remap = false, desc = "Info" })
			vim.keymap.set("n", "<leader>lh", function()
				vim.lsp.buf.inlay_hint(bufnr)
			end, { buffer = bufnr, remap = false, desc = "Toggle inlay hints" })
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
			vim.keymap.set("n", "<leader>rn", function()
				vim.lsp.buf.rename()
			end, { buffer = bufnr, remap = false, desc = "Rename symbol" })
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, { buffer = bufnr, remap = false, desc = "Signature help" })
		end

		lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
			capabilities = default_capabilities,
			on_attach = default_on_attach,
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({})
			end,
			["clangd"] = function()
				lspconfig.clangd.setup({ settings = require("servers.clangd") })
			end,
			["gopls"] = function()
				lspconfig.gopls.setup({ settings = require("servers.gopls") })
			end,
			["lua_ls"] = function()
				lspconfig.lua_ls.setup({ settings = require("servers.lua_ls") })
			end,
			["rust_analyzer"] = function()
				lspconfig.rust_analyzer.setup({
					settings = require("servers.rust-analyzer"),
					filetypes = { "rust" },
					root_dir = require("lspconfig/util").root_pattern("Cargo.toml"),
				})
			end,
			["tsserver"] = function()
				lspconfig.tsserver.setup({ settings = require("servers.tsserver") })
			end,
		})
	end,
}
