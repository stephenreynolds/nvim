local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd("TextYankPost", {
    group = augroup("HighlightYank", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end
})

-- Remove trailing whitespace on write
autocmd("BufWritePre", {
    group = augroup("BufWritePre", {}),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
