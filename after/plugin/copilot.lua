vim.g.copilot_filetypes = { markdown = false }

vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-f>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set("n", "<leader>Cc", "<cmd>Copilot panel<cr>")
vim.keymap.set("n", "<leader>Cd", "<cmd>Copilot disable<cr>")
vim.keymap.set("n", "<leader>Ce", "<cmd>Copilot enable<cr>")
vim.keymap.set("n", "<leader>Cs", "<cmd>Copilot status<cr>")
