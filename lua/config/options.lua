vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.laststatus = 3

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Column ruler
vim.opt.colorcolumn = "80,120"

-- Disable mouse
--vim.opt.mouse = ""

-- Leader key
vim.g.mapleader = " "

vim.opt.fillchars = "eob: "

-- Do not show mode
vim.opt.showmode = false

-- Use the current window to open a file in netrw
vim.g.netrw_browse_split = 0
-- Hide the netrw banner
vim.g.netrw_banner = 0
-- Set the width of the netrw window
vim.g.netrw_winsize = 25
