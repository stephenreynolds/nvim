-- undotree: Undo history visualizer.
return {
	"mbbill/undotree",
	config = function()
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_WindowLayout = 2
		vim.g.undotree_ShortIndicators = 1
	end,
	keymaps = {
		{
			"<leader>u",
			"<cmd>UndotreeToggle<cr>",
			desc = "Undo tree",
		},
	},
}
