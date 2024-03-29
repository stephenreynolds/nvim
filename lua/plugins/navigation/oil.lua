return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Oil",
  opts = {
    view_options = {
      show_hidden = true,
    },
    columns = {
      "icon",
    },
    float = {
      win_options = {
        winblend = 0,
      },
    },
  },
  keys = {
    {
      "<leader>e",
      "<cmd>Oil<cr>",
      desc = "Open file explorer",
    },
  },
}
