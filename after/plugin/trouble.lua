require("trouble").setup()

vim.keymap.set("n", "<leader>lq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true, desc = "Quickfix" })

vim.keymap.set("n", "<leader>lrr", "<cmd>TroubleToggle lsp_references<cr>",
    { buffer = bufnr, remap = false, desc = "References" })

vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>",
    { buffer = bufnr, remap = false, desc = "References" })

vim.keymap.set("n", "<leader>lD", "<cmd>TroubleToggle document_diagnostics<cr>",
    { buffer = bufnr, remap = false, desc = "Document diagnostics" })

vim.keymap.set("n", "<leader>lwd", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { buffer = bufnr, remap = false, desc = "Workspace diagnostics" })

vim.keymap.set("n", "<leader>lL", "<cmd>TroubleToggle loclist<cr>",
    { buffer = bufnr, remap = false, desc = "Location list" })
