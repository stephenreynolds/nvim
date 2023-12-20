-- Line numbers
vim.wo.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.numberwidth = 2

vim.o.laststatus = 3

vim.o.clipboard = "unnamedplus"

-- Indentation
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

-- Disable line wrap
vim.o.wrap = false
vim.o.breakindent = true
vim.o.showbreak = string.rep(" ", 3)
vim.o.linebreak = true

-- Disable swap file and backup, and enable undo file
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true
vim.opt.shada = { "!", "'1000", "<50", "s10", "h" }

-- Search highlighting
vim.o.hlsearch = true
vim.o.incsearch = true

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true

-- Keep lines above and below the cursor
vim.o.scrolloff = 10

-- Always show sign column
vim.wo.signcolumn = "yes"

vim.opt.isfname:append("@-@")

-- Timeouts
vim.o.updatetime = 50
vim.o.timeoutlen = 400

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Column ruler
vim.o.colorcolumn = "80,120"

-- Mouse
vim.o.mouse = "a"

-- Remove tildes in line column
vim.o.fillchars = "eob: "

-- Do not show mode
vim.o.showmode = false

-- Disable annoying "hit enter" messages
vim.opt.shortmess:append("sI")

-- Splits
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.equalalways = false

-- Folds
vim.o.foldmethod = "marker"
vim.o.foldlevel = 0
vim.o.modelines = 1

-- Do not unload buffers
vim.o.hidden = true

-- Show substitutions in split
vim.o.inccommand = "split"

-- Diff mode
vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }

-- Use the current window to open a file in netrw
vim.g.netrw_browse_split = 0
-- Hide the netrw banner
vim.g.netrw_banner = 0
-- Set the width of the netrw window
vim.g.netrw_winsize = 25
