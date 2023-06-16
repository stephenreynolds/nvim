-- Neotest: A framework for interacting with tests within NeoVim.
return {
	"nvim-neotest/neotest",
	depencencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
	},
	opts = function()
		return {
			consumers = {
				overseer = require("neotest.consumers.overseer"),
			},
		}
	end,
}
