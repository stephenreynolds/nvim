return {
	"junegunn/gv.vim",
    dependencies = {
        "tpope/vim-fugitive",
    },
	keys = {
		{
			"<leader>gv",
			"<cmd>GV<cr>",
			desc = "Commit browser",
		},
	},
}
