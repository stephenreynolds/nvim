local opt = vim.opt

-- Line number
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.numberwidth = 2

-- Clipboard
opt.clipboard = "unnamedplus"

-- Indentation
opt.expandtab = true
opt.shiftround = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Disable line wrap
opt.wrap = false
opt.breakindent = true
opt.showbreak = string.rep(" ", 3)
opt.linebreak = true

-- Set completeopt to have a better completion experience
opt.completeopt = "menu,menuone,noselect"

opt.conceallevel = 2

-- Ask to save changes before exiting the buffer instead of refusing
opt.confirm = true

-- Formatting
opt.formatoptions = "jcroqlnt"

-- Disable swap file and backup, and enable undo file
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.undolevels = 10000
opt.shada = { "!", "'1000", "<50", "s10", "h" }

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- Search highlighting
opt.hlsearch = true
opt.incsearch = true

-- True color support
opt.termguicolors = true

-- Show substitutions in split
opt.inccommand = "split"

-- Show status line only for the last window
opt.laststatus = 3

-- Mouse
opt.mouse = "a"

opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

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

-- Modes
opt.showmode = false
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command line completion mode

opt.winminwidth = 5

-- Disable some annoying messages
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

-- Diff mode
opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }

-- netrw
vim.g.netrw_browse_split = 0 -- Use the current window to open a file in netrw
vim.g.netrw_banner = 0 -- Hide the netrw banner
vim.g.netrw_winsize = 25 -- Set the width of the netrw window
