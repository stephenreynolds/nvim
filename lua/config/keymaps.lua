vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrapth
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Map write and quite from leader
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Write" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohls<cr>", { desc = "Clear search", silent = true })

-- Move selection in and out of blocks
vim.keymap.set("v", "<S-down>", ":m '>+1<cr>gv=gv", { desc = "Move down out of block, silent = true" })
vim.keymap.set("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down out of block, silent = true" })
vim.keymap.set("v", "<S-up>", ":m '<-2<cr>gv=gv", { desc = "Move up out of block, silent = true" })
vim.keymap.set("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up out of block, silent = true" })

-- Move lines up and down
vim.keymap.set("n", "<M-j>", function()
  if vim.opt.diff:get() then
    vim.cmd([[normal! ]c]])
  else
    vim.cmd([[m .+1<cr>==]])
  end
end, { desc = "Move line down" })

vim.keymap.set("n", "<M-k>", function()
  if vim.opt.diff:get() then
    vim.cmd([[normal! ]c]])
  else
    vim.cmd([[m .-2<cr>==]])
  end
end, { desc = "Move line up" })

-- Keep cursor in place when joining lines
vim.keymap.set("n", "<S-down>", "mzJ`z", { desc = "Join line down" })
vim.keymap.set("n", "<S-j>", "mzJ`z", { desc = "Join line down" })

-- Paste over and delete selection, instead of copying the selection
vim.keymap.set("x", "<leader>P", '"_dP', { desc = "Paste over selection" })

-- Keep cursor centered vertically when jumping half page
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump half page up" })

-- Keep cursor centered vertically when jumping between search results
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous search result" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })

-- Delete to the void register
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Move to next/previous error in quickfix list
vim.keymap.set("n", "<C-up>", "<cmd>cnext<cr>zz", { desc = "Next error" })
vim.keymap.set("n", "<C-k>", "<cmd>cnext<cr>zz", { desc = "Next error" })
vim.keymap.set("n", "<C-down>", "<cmd>cprev<cr>zz", { desc = "Previous error" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<cr>zz", { desc = "Previous error" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

-- Make Q do nothing
vim.keymap.set("n", "Q", "<nop>", { desc = "[disabled]" })

-- Replace all instances of a word in the buffer
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word" })

-- Terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal" })
