return {
	"L3MON4D3/LuaSnip",
	version = "1.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
