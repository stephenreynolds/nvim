return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  version = false,
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  opts = {
    behaviour = {
      auto_suggestions = false,
    },
    hints = { enabled = true },
    mappings = {
      ask = "<leader>ia",
      edit = "<leader>ie",
      refresh = "<leader>ir",
      toggle = {
        debug = "<leader>iTd",
        hint = "<leader>iTh",
      },
    },
  },
}
