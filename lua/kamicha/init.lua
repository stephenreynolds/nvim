require("kamicha.remap")
require("kamicha.set")
require("kamicha.packer")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        local hl_groups = {
            "Normal",
            "SignColumn",
            "NormalNC",
            "TelescopeBorder",
            "NvimTreeNormal",
            "EndOfBuffer",
            "MsgArea",
        }
        for _, name in ipairs(hl_groups) do
            vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
        end
    end,
})
vim.opt.fillchars = "eob: "

-- Highlight on yank
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end
})

-- Remove trailing whitespace on write
local kamicha_group = augroup('kamicha', {})
autocmd({"BufWritePre"}, {
    group = kamicha_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Use the current window to open a file in netrw
vim.g.netrw_browse_split = 0
-- Hide the netrw banner
vim.g.netrw_banner = 0
-- Set the width of the netrw window
vim.g.netrw_winsize = 25
