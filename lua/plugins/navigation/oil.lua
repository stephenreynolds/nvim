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
    keymaps = {
      ["<C-h>"] = false,
      ["<M-h>"] = "actions.select_split",
      ["<C-l>"] = false,
      ["<M-l>"] = "actions.refresh",
    },
  },
  keys = {
    {
      "-",
      "<cmd>Oil<cr>",
      desc = "Open file explorer",
    },
  },
}
