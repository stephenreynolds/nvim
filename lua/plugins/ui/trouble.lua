-- trouble: A pretty list of diagnostics.
return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>lq",
			"<cmd>TroubleToggle quickfix<cr>",
			silent = true,
			noremap = true,
			desc = "Quickfix",
		},
		{
			"<leader>lr",
			"<cmd>TroubleToggle lsp_references<cr>",
			buffer = bufnr,
			remap = false,
			desc = "References",
		},
		{
			"gr",
			"<cmd>TroubleToggle lsp_references<cr>",
			buffer = bufnr,
			remap = false,
			desc = "References",
		},
		{
			"<leader>lD",
			"<cmd>TroubleToggle document_diagnostics<cr>",
			buffer = bufnr,
			remap = false,
			desc = "Document diagnostics",
		},
		{
			"<leader>lwd",
			"<cmd>TroubleToggle workspace_diagnostics<cr>",
			buffer = bufnr,
			remap = false,
			desc = "Workspace diagnostics",
		},
		{
			"<leader>lL",
			"<cmd>TroubleToggle loclist<cr>",
			buffer = bufnr,
			remap = false,
			desc = "Location list",
		},
	},
}
