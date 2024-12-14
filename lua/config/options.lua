local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.numberwidth = 2

opt.laststatus = 3

opt.clipboard = "unnamedplus"

-- Indentation
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftround = true

-- Disable line wrap
opt.wrap = false
opt.breakindent = true
opt.showbreak = string.rep(" ", 3)
opt.linebreak = true

-- Disable swap file and backup, and enable undo file
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.undolevels = 10000
opt.shada = { "!", "'1000", "<50", "s10", "h" }

-- Search highlighting
opt.hlsearch = true
opt.incsearch = true

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

opt.termguicolors = true

-- Keep lines above and below the cursor
opt.scrolloff = 10
opt.sidescrolloff = 8

-- Always show sign column
opt.signcolumn = "yes"

opt.isfname:append("@-@")

-- Timeouts
opt.updatetime = 50
opt.timeoutlen = 300

-- Sessions
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

-- Set completeopt to have a better completion experience
opt.completeopt = "menu,menuone,noselect"

opt.conceallevel = 2

-- Ask to save changes before exiting the buffer instead of refusing
-- opt.confirm = true

-- Formatting
opt.formatoptions = "jcroqlnt"

-- Column ruler
-- opt.colorcolumn = "80,120"

-- Mouse
opt.mouse = "a"

-- Remove tildes in line column
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Do not show mode
opt.showmode = false
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command line completion mode

-- Minimum window width
opt.winminwidth = 5

-- Disable annoying "hit enter" messages
opt.shortmess:append({ W = true, I = true, c = true, C = true, s = true })

-- Splits
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.equalalways = false

-- Folds
opt.foldmethod = "marker"
opt.foldlevel = 99
opt.modelines = 1

-- Do not unload buffers
opt.hidden = true

-- Show substitutions in split
opt.inccommand = "split"

-- Diff mode
opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }

-- Use the current window to open a file in netrw
vim.g.netrw_browse_split = 0
-- Hide the netrw banner
vim.g.netrw_banner = 0
-- Set the width of the netrw window
vim.g.netrw_winsize = 25

local netrw_list_hide = vim.fn["netrw_gitignore#Hide"]()
vim.g.netrw_list_hide = netrw_list_hide

local wildignore = vim.fn.substitute(netrw_list_hide .. ",**/.git/*", "/,", "/*,", "g")
opt.wildignore:append(wildignore)

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
