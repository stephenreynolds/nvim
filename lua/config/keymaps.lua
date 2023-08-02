vim.g.mapleader = " "

-- Map write and quite from leader
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Write" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Move selection in and out of blocks
vim.keymap.set("v", "<S-down>", ":m '>+1<cr>gv=gv", { desc = "Move down out of block, silent = true" })
vim.keymap.set("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down out of block, silent = true" })
vim.keymap.set("v", "<S-up>", ":m '<-2<cr>gv=gv", { desc = "Move up out of block, silent = true" })
vim.keymap.set("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up out of block, silent = true" })

-- Keep cursor in place when joining lines
vim.keymap.set("n", "<S-down>", "mzJ`z", { desc = "Join line down" })
vim.keymap.set("n", "<S-j>", "mzJ`z", { desc = "Join line down" })

-- Paste over and delete selection, insead of copying the selection
vim.keymap.set("x", "<leader>P", '"_dP', { desc = "Paste over selection" })

-- Keep cursor centered vertically when jumping half page
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump half page up" })
