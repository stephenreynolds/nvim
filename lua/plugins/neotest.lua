-- Neotest: A framework for interacting with tests within NeoVim.
return {
	{
		"nvim-neotest/neotest",
		depencencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-go",
		},
		config = function()
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function()
						local message =
							diagnostic.message:gsub("\n", " ").gsub("\t", " "):gsub("%s+", " "):gsub("^%s", "")
						return message
					end,
				},
			}, neotest_ns)
			require("neotest").setup({
				adapters = {
					require("neotest-go"),
				},
				consumers = {
					overseer = require("neotest.consumers.overseer"),
				},
			})
		end,
	},
	{ "nvim-neotest/neotest-go" },
}
