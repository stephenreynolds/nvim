return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "echasnovski/mini.icons",
  },
  opts = {
    preset = "modern",
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>b", group = "+buffer" },
        { "<leader>g", group = "+git" },
        { "<leader>i", group = "+ai" },
        { "<leader>l", group = "+lsp" },
        { "<leader>lf", group = "+format" },
        { "<leader>lw", group = "+workspace" },
        { "<leader>N", group = "+notifications" },
        { "<leader>o", group = "+task runner" },
        { "<leader>s", group = "+search" },
        { "<leader>t", group = "+test" },
        { "<leader>T", group = "+toggle" },
        { "<leader>v", group = "+terminal" },
      },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
  end,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {
      "<c-w><space>",
      function()
        require("which-key").show({ keys = "<c-w>", loop = true })
      end,
      desc = "Window Hydra Mode (which-key)",
    },
  },
}
