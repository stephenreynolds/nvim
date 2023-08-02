-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.numberwidth = 2

vim.opt.laststatus = 3

-- Indentation
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Disable line wrap
vim.opt.wrap = false

-- Disable swap file and backup, and enable undo file
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Keep lines above and below the cursor
vim.opt.scrolloff = 8

-- Always show sign column
vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")

-- Timeouts
vim.opt.updatetime = 50
vim.opt.timeoutlen = 400

-- Column ruler
vim.opt.colorcolumn = "80,120"

-- Mouse
vim.opt.mouse = "a"

-- Remove tildes in line column
vim.opt.fillchars = "eob: "

-- Do not show mode
vim.opt.showmode = false

-- Disable annoying "hit enter" messages
vim.opt.shortmess:append("sI")

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Use the current window to open a file in netrw
vim.g.netrw_browse_split = 0
-- Hide the netrw banner
vim.g.netrw_banner = 0
-- Set the width of the netrw window
vim.g.netrw_winsize = 25
