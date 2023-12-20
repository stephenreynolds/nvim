return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = "Neorg",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = {
            folds = false,
            icon_preset = "diamond",
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Documents/Neorg",
            },
            default_workspace = "notes",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
      },
    })
  end,
  keys = {
    {
      "<leader>nn",
      "<cmd>Neorg workspace notes<cr>",
      desc = "Notes",
    },
    {
      "<leader>nr",
      "<cmd>Neorg return<cr>",
      desc = "Return from notes",
    },
  },
}
