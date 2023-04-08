require("kamicha.remap")
require("kamicha.set")
require("kamicha.packer")

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

vim.api.nvim_exec([[
    augroup highlight_yank
    autocmd!
    augroup END
]], false)

vim.api.nvim_command("autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup='Visual', timeout=200})")
-- Use the current window to open a file in netrw
vim.g.netrw_browse_split = 0
-- Hide the netrw banner
vim.g.netrw_banner = 0
-- Set the width of the netrw window
vim.g.netrw_winsize = 25
