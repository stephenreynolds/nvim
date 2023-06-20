return {
	"rcarriga/nvim-notify",
	lazy = true,
	opts = {
		background_colour = "#000000",
	},
	keys = {
		{
			"<leader>nd",
			function()
				require("notify").dismiss({ silent = true, pending = true })
			end,
			desc = "Dismiss all notifications",
		},
	},
}
