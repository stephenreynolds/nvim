vim.g.copilot_filetypes = { markdown = false }

vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-f>", 'copilot#Accept("<CR>")', { silent = true, expr = true, desc = "Accept" })
vim.keymap.set("n", "<leader>Cc", "<cmd>Copilot panel<cr>", { desc = "Panel" })
vim.keymap.set("n", "<leader>Cd", "<cmd>Copilot disable<cr>", { desc = "Disable" })
vim.keymap.set("n", "<leader>Ce", "<cmd>Copilot enable<cr>", { desc = "Enable" })
vim.keymap.set("n", "<leader>Cs", "<cmd>Copilot status<cr>", { desc = "Status" })
