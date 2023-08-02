return {
	"nvim-telescope/telescope-frecency.nvim",
	dependencies = { "kkharji/sqlite.lua" },
	event = "VimEnter",
	config = function()
		require("telescope").load_extension("frecency")
	end,
}
