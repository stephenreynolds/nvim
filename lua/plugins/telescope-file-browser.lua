-- telescope-file-browser: A file browser extension for telescope.nvim.
return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	config = function()
		require("telescope").load_extension("file_browser")
	end,
}
