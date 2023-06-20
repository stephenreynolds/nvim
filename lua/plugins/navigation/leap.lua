-- leap: Neovim's answer to the mouse.
return {
	"ggandor/leap.nvim",
	depencencies = { "tpope/vim-repeat" },
	config = function()
		require("leap").add_default_mappings()
	end,
}
