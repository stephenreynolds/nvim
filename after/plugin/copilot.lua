vim.g.copilot_filetypes = {
    markdown = false
}

vim.g.copilot_no_tab_map = true

vim.keymap.set("i", "<C-f>", 'copilot#Accept("<CR>")', { silent = true, expr = true, desc = "Accept" })
vim.keymap.set("n", "<leader>iCc", "<cmd>Copilot panel<cr>", { desc = "Panel" })
vim.keymap.set("n", "<leader>iCd", "<cmd>Copilot disable<cr>", { desc = "Disable" })
vim.keymap.set("n", "<leader>iCe", "<cmd>Copilot enable<cr>", { desc = "Enable" })
vim.keymap.set("n", "<leader>iCs", "<cmd>Copilot status<cr>", { desc = "Status" })
