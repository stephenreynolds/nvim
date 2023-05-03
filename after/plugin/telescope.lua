local builtin = require('telescope.builtin')


vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = "Find file" })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "Find file" })
vim.keymap.set("n", "<leader>sB", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme" })
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
vim.keymap.set("n", "<leader>sH", "<cmd>Telescope highlights<cr>", { desc = "Find highlight groups" })
vim.keymap.set("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", { desc = "Manpages" })
vim.keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Open recent file" })
vim.keymap.set("n", "<leader>sR", "<cmd>Telescope registers<cr>", { desc = "Registers" })
vim.keymap.set("n", "<leader>st", "<cmd>Telescope live_grep<cr>", { desc = "Text" })
vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sC", "<cmd>Telescope commands<cr>", { desc = "Commands" })
vim.keymap.set("n", "<leader>sp", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", { desc = "Colorscheme with preview" })

vim.keymap.set('n', '<leader>gb', "<cmd>Telescope git_branches<cr>", { desc = "Checkout" })

vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>lI", "<cmd>Mason<cr>", { desc = "Mason Info" })
vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document symbols" })
vim.keymap.set("n", "<leader>lws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace symbols" })

vim.keymap.set('n', '<leader>e', "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", { desc = "File browser" })
