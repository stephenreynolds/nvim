return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
      {
        "<leader>xq",
        "<cmd>TroubleToggle quickfix<cr>",
        silent = true,
        noremap = true,
        desc = "Quickfix",
      },
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
        "<leader>xL",
        "<cmd>TroubleToggle loclist<cr>",
        remap = false,
        desc = "Location list",
      },
    },
  },

  {
    'folke/which-key.nvim',
    optional = true,
    opts = {
      defaults = {
        ['<leader>x'] = { name = '+trouble' },
        ['<leader>xw'] = { name = '+workspace' }
      }
    }
  }
}
