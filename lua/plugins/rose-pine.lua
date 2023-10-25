return {
  "rose-pine/neovim",
  enabled = true,
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  opts = {
    disable_float_background = true,
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd("colorscheme rose-pine")
  end,
}
