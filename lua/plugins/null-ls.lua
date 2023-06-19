-- null-ls: Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
return {
	"jose-elias-alvarez/null-ls.nvim",
	depencencies = { "nvim-lua/plenary.nvim" },
	opts = function()
		local null_ls = require("null-ls")
		local null_opts = require("lsp-zero").build_options("null-ls", {})

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			on_attach = function(client, bufnr)
				null_opts.on_attach(client, bufnr)
			end,
			sources = {
				diagnostics.eslint,
				formatting.stylua,
				formatting.prettierd,
				formatting.clang_format,
				formatting.jq,
				formatting.mdformat,
				formatting.rustfmt,
				formatting.shfmt,
			},
		})
	end,
}
