return {
	"nguyenvukhang/nvim-toggler",
	opts = {
		remove_default_keybinds = true,
	},
	keys = {
		{
			"<C-i>",
			function()
				require("nvim-toggler").toggle()
			end,
			mode = { "n", "v" },
			desc = "Invert text",
		},
	},
}
