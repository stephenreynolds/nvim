return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
    lazy = true,
	config = function()
		vim.o.foldcolumn = "0"
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
		local language_servers = require("lspconfig").util.available_servers()
		for _, ls in ipairs(language_servers) do
			require("lspconfig")[ls].setup({
				capabilities = capabilities,
			})
		end
		require("ufo").setup()
	end,
	keys = {
		{
			"zR",
			"<cmd>lua require('ufo').openAllFolds()<cr>",
			desc = "Open all folds",
		},
		{
			"zM",
			"<cmd>lua require('ufo').closeAllFolds()<cr>",
			desc = "Close all folds",
		},
	},
}
