return {
  "folke/which-key.nvim",
  opts = {
    preset = "modern",
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      {
        mode = { "n", "v" },
        { "<leader>b", group = "+buffer" },
        { "<leader>d", group = "+debug" },
        { "<leader>db", group = "+breakpoints" },
        { "<leader>g", group = "+git" },
        { "<leader>h", group = "+hunk" },
        { "<leader>i", group = "+ai" },

        { "<leader>l", group = "+lsp" },
        { "<leader>lf", group = "+format" },
        { "<leader>lw", group = "+workspace" },

        { "<leader>N", group = "+notifications" },
        { "<leader>o", group = "+task runner" },
        { "<leader>r", group = "+refactor" },
        { "<leader>s", group = "+search" },
        { "<leader>t", group = "+test" },
        { "<leader>T", group = "+toggle" },
        { "<leader>v", group = "+terminal" },
        { "<leader>x", group = "+trouble" },
        { "<leader>xw", group = "+workspace" },
      },
    })
  end,
}
