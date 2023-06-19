return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    cmd = "LspInfo",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function()
                vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { buffer = bufnr, remap = false, desc = "Info" })
                vim.keymap.set("n", "<leader>lf", function()
                    vim.lsp.buf.format()
                end, { buffer = bufnr, remap = false, desc = "Format" })
                vim.keymap.set("n", "gd", function()
                    vim.lsp.buf.definition()
                end, { buffer = bufnr, remap = false, desc = "Go to definition" })
                vim.keymap.set("n", "K", function()
                    vim.lsp.buf.hover()
                end, { buffer = bufnr, remap = false, desc = "Hover" })
                vim.keymap.set("n", "<leader>ld", function()
                    vim.diagnostic.open_float()
                end, { buffer = bufnr, remap = false, desc = "Open diagnostics popup" })
                vim.keymap.set("n", "<leader>[d", function()
                    vim.diagnostic.goto_prev()
                end, { buffer = bufnr, remap = false, desc = "Go to previous diagnostic" })
                vim.keymap.set("n", "<leader>]d", function()
                    vim.diagnostic.goto_next()
                end, { buffer = bufnr, remap = false, desc = "Go to next diagnostic" })
                vim.keymap.set("n", "<leader>la", function()
                    vim.lsp.buf.code_action()
                end, { buffer = bufnr, remap = false, desc = "Code action" })
                vim.keymap.set("n", "<leader>ll", function()
                    vim.lsp.codelens.run()
                end, { buffer = bufnr, remap = false, desc = "CodeLens" })
                vim.keymap.set("n", "<leader>lrn", function()
                    vim.lsp.buf.rename()
                end, { buffer = bufnr, remap = false, desc = "Rename symbol" })
                vim.keymap.set("i", "<C-h>", function()
                    vim.lsp.buf.signature_help()
                end, { buffer = bufnr, remap = false, desc = "Signature help" })
            end
        })
    end
}
