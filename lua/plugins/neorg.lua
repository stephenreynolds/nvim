return {
  {
    "nvim-neorg/neorg",
    enabled = false,
    lazy = false,
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-cmp",
      "nvim-neorg/neorg-telescope",
      { "3rd/image.nvim", opts = {} },
      {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
      },
    },
    cmd = "Neorg",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            config = {
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
          ["core.keybinds"] = {
            -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
            config = {
              default_keybinds = true,
              neorg_leader = "<Leader><Leader>",
            },
          },
          ["core.integrations.nvim-cmp"] = {},
          ["core.integrations.telescope"] = {},
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
      {
        "<leader>nc",
        "<cmd>Neorg toggle-concealer<cr>",
        desc = "Toggle concealer",
      },
      {
        "<leader><leader>sf",
        "<cmd>Telescope neorg find_norg_files<cr>",
        desc = "Search notes",
      },
      {
        "<leader><leader>sw",
        "<cmd>Telescope neorg switch_workspace<cr>",
        desc = "Switch workspace",
      },
      {
        "gf",
        "<Plug>(neorg.esupports.hop.hop-link)",
        desc = "Go to link under cursor",
        ft = "norg",
      },
    },
  },

  {
    "folke/which-key.nvim",
    optional = true,
    opts = function()
      require("which-key").add({
        { "<learder>n", group = "+neorg" },
      })
    end,
  },
}
