local map = vim.keymap.set

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrapth
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<A-S-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-S-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-S-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-S-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Scroll buffer
map("n", "<Up>", "<C-y>", { desc = "Scroll up" })
map("n", "<Down>", "<C-e>", { desc = "Scroll down", noremap = true })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to other buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Move selection in and out of blocks
map("v", "<S-down>", ":m '>+1<cr>gv=gv", { desc = "Move down out of block, silent = true" })
map("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down out of block, silent = true" })
map("v", "<S-up>", ":m '<-2<cr>gv=gv", { desc = "Move up out of block, silent = true" })
map("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up out of block, silent = true" })

-- Move lines up and down
map("n", "<M-j>", function()
  if vim.opt.diff:get() then
    vim.cmd([[normal! ]c]])
  else
    vim.cmd([[m .+1<cr>==]])
  end
end, { desc = "Move line down" })

map("n", "<M-k>", function()
  if vim.opt.diff:get() then
    vim.cmd([[normal! ]c]])
  else
    vim.cmd([[m .-2<cr>==]])
  end
end, { desc = "Move line up" })

-- Keep cursor in place when joining lines
map("n", "<S-down>", "mzJ`z", { desc = "Join line down" })
map("n", "<S-j>", "mzJ`z", { desc = "Join line down" })

-- Paste over and delete selection, instead of copying the selection
map("x", "<leader>P", '"_dP', { desc = "Paste over selection" })

-- Keep cursor centered vertically when jumping half page
map("n", "<C-d>", "<C-d>zz", { desc = "Jump half page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Jump half page up" })

-- Keep cursor centered vertically when jumping between search results
map("n", "n", "nzzzv", { desc = "Jump to next search result" })
map("n", "N", "Nzzzv", { desc = "Jump to previous search result" })

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    ---@diagnostic disable-next-line: assign-type-mismatch
    go({ severity = severity })
  end
end
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Move to next/previous error in quickfix list
map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- Make Q do nothing
map("n", "Q", "<nop>", { desc = "[disabled]" })

-- Replace all instances of a word in the buffer
map("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word" })

-- Terminal mode
map("n", "<leader>vv", "<cmd>terminal<cr>", { desc = "Open new terminal" })
map("n", "<leader>vV", "<cmd>tab terminal<cr>", { desc = "Open new terminal in new tab" })
map("n", "<leader>vb", function()
  vim.cmd.new()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end, { desc = "Open new terminal at bottom" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal" })

-- Tabs
map("n", "<leader>bt", "<cmd>tab new<cr>", { desc = "Open new tab" })
map("n", "<leader>bc", "<cmd>tab close<cr>", { desc = "Close tab" })
map("n", "<leader>bs", "<C-W><S-T>", { desc = "Move current buffer to new tab" })
map("n", "<Right>", function()
  pcall(vim.cmd, [[checktime]])
  vim.api.nvim_feedkeys("gt", "n", true)
end, { desc = "Go to next tab" })
map("n", "<Left>", function()
  pcall(vim.cmd, [[checktime]])
  vim.api.nvim_feedkeys("gT", "n", true)
end, { desc = "Go to previous tab" })
map("n", "<S-Right>", "<cmd>tabmove +<cr>", { desc = "Move tab right" })
map("n", "<S-Left>", "<cmd>tabmove -<cr>", { desc = "Move tab right" })
