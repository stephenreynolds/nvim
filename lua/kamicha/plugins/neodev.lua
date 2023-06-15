-- neodev.nvim: Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
return {
	"folke/neodev.nvim",
	opts = {
		library = { plugins = { "nvim-dap-ui" }, types = true },
	},
}
