return {
  {
    "echasnovski/mini.nvim",
    config = function()
      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = true })
    end,
  },

  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = {
      n_lines = 500,
    },
  },
}
