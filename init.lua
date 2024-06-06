vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.ai" },
    { import = "plugins.coding" },
    { import = "plugins.colorscheme" },
    { import = "plugins.editor" },
    { import = "plugins.git" },
    { import = "plugins.lang" },
    { import = "plugins.linting" },
    { import = "plugins.navigation" },
    { import = "plugins.ui" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  lockfile = (vim.env.NVIM_SRC or vim.fn.stdpath("config")) .. "/lazy-lock.json",
  change_detection = {
    notify = false,
  },
  ui = {
    border = "rounded",
    title = "Plugins",
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.keymap.set("n", "<leader>P", "<cmd>Lazy<cr>", { desc = "Plugins" })
