return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble" },
    opts = {},
    keys = {
      {
        "<leader>xr",
        "<cmd>Trouble lsp_references toggle<cr>",
        remap = false,
        desc = "References",
      },
      {
        "gr",
        "<cmd>Trouble lsp_references toggl>",
        remap = false,
        desc = "References",
      },
      {
        "<leader>xD",
        "<cmd>Trouble diagnostics toggle<cr>",
        remap = false,
        desc = "Document diagnostics",
      },
      {
        "<leader>xl",
        "<cmd>Trouble loclist toggle<cr>",
        remap = false,
        desc = "Location list",
      },
    },
  },
}
