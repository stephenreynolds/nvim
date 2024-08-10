return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
      {
        "<leader>xr",
        "<cmd>TroubleToggle lsp_references<cr>",
        remap = false,
        desc = "References",
      },
      {
        "gr",
        "<cmd>TroubleToggle lsp_references<cr>",
        remap = false,
        desc = "References",
      },
      {
        "<leader>xD",
        "<cmd>TroubleToggle document_diagnostics<cr>",
        remap = false,
        desc = "Document diagnostics",
      },
      {
        "<leader>xwd",
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        remap = false,
        desc = "Workspace diagnostics",
      },
      {
        "<leader>xl",
        "<cmd>TroubleToggle loclist<cr>",
        remap = false,
        desc = "Location list",
      },
    },
  },
}
