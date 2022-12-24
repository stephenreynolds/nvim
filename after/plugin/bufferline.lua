vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        diagnostics = "nvim_lsp",
        hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" }
        }
    }
}
