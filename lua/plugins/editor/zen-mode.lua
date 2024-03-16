return {
  "folke/zen-mode.nvim",
  opts = {
    on_open = function(win)
      vim.keymap.set("n", "ZZ", "<cmd>ZenMode|x!<cr>", { noremap = true, silent = true })
      vim.keymap.set("n", "ZQ", "<cmd>ZenMode|q!<cr>", { noremap = true, silent = true })
    end,
  },
  keys = {
    {
      "<leader>Tz",
      function()
        require("zen-mode").toggle({ window = { width = 0.55 } })
      end,
      desc = "Toggle zen mode",
    },
  },
}
