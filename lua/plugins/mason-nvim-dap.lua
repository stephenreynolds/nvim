-- mason-nvim-dap: Automatically set up DAPs with Mason
return {
	"jay-babu/mason-nvim-dap.nvim",
	event = "VeryLazy",
	opts = function()
		local mason_dap = require("mason-nvim-dap")
		return {
			ensure_installed = {
				"codelldb",
			},
			automatic_installation = true,
			handlers = {
				function(config)
					mason_dap.default_setup(config)
				end,
			},
		}
	end,
}
