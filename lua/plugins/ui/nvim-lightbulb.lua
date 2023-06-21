return {
	"kosayoda/nvim-lightbulb",
	dependencies = { "antoinemadec/FixCursorHold.nvim" },
    event = { "BufReadPre", "BufNewFile" },
	opts = {
		autocmd = { enabled = true },
	},
}
