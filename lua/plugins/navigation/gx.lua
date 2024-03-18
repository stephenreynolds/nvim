return {
  "chrishrb/gx.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "Browse" },
  init = function()
    vim.g.netrw_nogx = 1
  end,
  config = true,
  keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
}
