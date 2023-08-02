return {
	"jay-babu/mason-nvim-dap.nvim",
    dependencies = {"mfussenegger/nvim-dap", "williamboman/mason.nvim"},
    cmd = "Mason",
	opts = function()
		local mason_dap = require("mason-nvim-dap")
		return {
			ensure_installed = {
				"codelldb",
				"go-debug-adapter",
				"delve",
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
