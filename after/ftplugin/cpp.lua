vim.keymap.set(
	"n",
	"<leader><leader>a",
	"<cmd>ClangdSwitchSourceHeader<cr>",
	{ noremap = true, silent = true, desc = "Switch source/header" }
)
