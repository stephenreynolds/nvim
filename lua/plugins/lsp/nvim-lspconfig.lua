return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	cmd = "LspInfo",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local function lspSymbol(name, icon)
			local hl = "DiagnosticSign" .. name
			vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
		end

		lspSymbol("Error", "󰅙")
		lspSymbol("Info", "󰋼")
		lspSymbol("Hint", "󰌵")
		lspSymbol("Warn", "")
	end,
}
