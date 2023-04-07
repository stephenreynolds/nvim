vim.g.mapleader = " "

-- Move selection in and out of code blocks.
vim.keymap.set("v", "<S-up>", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "<S-down>", ":m '>+1<cr>gv=gv")

-- Keep cursor in place when joining lines.
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor centered vertically when jumping half page.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor centered vertically when jumping between search results.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over and delete selection, instead of copying the selection.
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete to the void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Make Q do nothing
vim.keymap.set("n", "Q", "<nop>")

-- Replace all instances of a word in the buffer.
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
