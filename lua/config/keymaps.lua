vim.g.mapleader = " "

-- Map write and quit from leader
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Write" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Move selection in and out of code blocks.
vim.keymap.set("v", "<S-down>", ":m '>+1<cr>gv=gv", { desc = "Move down out of block", silent = true })
vim.keymap.set("v", "<S-up>", ":m '<-2<cr>gv=gv", {
	desc = "Move up out of block",
	silent = true,
})

-- Keep cursor in place when joining lines.
vim.keymap.set("n", "<S-down>", "mzJ`z", { desc = "Join line down" })

-- Keep cursor centered vertically when jumping half page.
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump half page up" })

-- Keep cursor centered vertically when jumping between search results.
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous search result" })

-- Paste over and delete selection, instead of copying the selection.
vim.keymap.set("x", "<leader>P", '"_dP', { desc = "Paste over selection" })

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy to system clipboard" })

-- Delete to the void register
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Move to next/previous error in quickfix list.
vim.keymap.set("n", "<C-up>", "<cmd>cnext<CR>zz", { desc = "Next error" })
vim.keymap.set("n", "<C-down>", "<cmd>cprev<CR>zz", { desc = "Previous error" })
vim.keymap.set("n", "<M-up>", "<cmd>lnext<CR>zz", { desc = "Next error (local)" })
vim.keymap.set("n", "<M-down>", "<cmd>lprev<CR>zz", { desc = "Previous error (local)" })

-- Make Q do nothing
vim.keymap.set("n", "Q", "<nop>", { desc = "[disabled]" })

-- Replace all instances of a word in the buffer.
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word" })

-- Make the current file executable.
vim.keymap.set("n", "<leader>x", function()
	vim.cmd("silent !chmod +x " .. vim.fn.expand("%"))
	local filename = vim.fn.expand("%:t")
	print("Made " .. filename .. " executable.")
end, { silent = true, desc = "Make executable" })

-- Source the current file.
vim.keymap.set("n", "<leader>S", function()
	vim.cmd("so")
end, { desc = "Source file" })

-- Terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal" })
