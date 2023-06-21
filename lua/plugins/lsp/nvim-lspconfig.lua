return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    lazy = false,
    config = function()
        local function lspSymbol(name, icon)
            local hl = "DiagnosticSign" .. name
            vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
        end

        lspSymbol("Error", "󰅙")
        lspSymbol("Info", "󰋼")
        lspSymbol("Hint", "󰌵")
        lspSymbol("Warn", "")

        vim.diagnostic.config({
            virtual_text = {
                prefix = "",
            },
            signs = true,
            underline = true,
            update_in_insert = false,
        })
    end,
}
