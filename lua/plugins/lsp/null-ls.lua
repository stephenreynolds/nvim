return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        return {
            sources = {
                diagnostics.eslint,
                formatting.stylua,
                formatting.prettierd,
                formatting.clang_format,
                formatting.jq,
                formatting.mdformat,
                formatting.rustfmt,
                formatting.shfmt,
            },
        }
    end,
}
