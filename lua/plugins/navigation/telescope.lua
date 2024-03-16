return {
  "nvim-telescope/telescope.nvim",
  version = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
    },
  },
  opts = {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "-L",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },

      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",

      layout_strategy = "flex",
      layout_config = {
        horizontal = {
          prompt_position = "bottom",
          preview_width = 0.55,
        },
        vertical = {
          mirror = true,
          preview_height = 0.45,
        },
        flex = {
          flip_columns = 140,
        },
        width = 0.87,
        height = 0.80,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      undo = {
        side_by_side = true,
        layout_strategy = "vertical",
        layout_config = {
          preview_height = 0.8,
        },
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown(),
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("undo")
    telescope.load_extension("ui-select")
  end,
  keys = {
    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          previewer = false,
        }))
      end,
      desc = "Fuzzy search in current buffer",
    },
    {
      "<leader>f",
      "<cmd>Telescope find_files<cr>",
      require("telescope.builtin").find_files,
      desc = "Find file",
    },
    {
      "<leader>sf",
      require("telescope.builtin").find_files,
      desc = "Find file",
    },
    {
      "<leader>sc",
      function()
        require("telescope.builtin").colorscheme({ enable_preview = true })
      end,
      desc = "Colorscheme with preview",
    },
    {
      "<leader>sb",
      require("telescope.builtin").buffers,
      desc = "Buffers",
    },
    {
      "<leader>,",
      require("telescope.builtin").buffers,
      desc = "Buffers",
    },
    {
      "<leader>sh",
      require("telescope.builtin").help_tags,
      desc = "Find Help",
    },
    {
      "<leader>sH",
      require("telescope.builtin").highlights,
      desc = "Find highlight groups",
    },
    {
      "<leader>sm",
      require("telescope.builtin").marks,
      desc = "Marks",
    },
    {
      "<leader>sM",
      require("telescope.builtin").man_pages,
      desc = "Manpages",
    },
    {
      "<leader>s.",
      require("telescope.builtin").oldfiles,
      desc = "Open recent file",
    },
    {
      "<leader>sr",
      require("telescope.builtin").resume,
      desc = "Resume",
    },
    {
      "<leader>ss",
      require("telescope.builtin").builtin,
      desc = "Select telescope",
    },
    {
      "<leader>sR",
      require("telescope.builtin").registers,
      desc = "Registers",
    },
    {
      "<leader>st",
      require("telescope.builtin").live_grep,
      desc = "Text",
    },
    {
      "<leader>sk",
      require("telescope.builtin").keymaps,
      desc = "Keymaps",
    },
    {
      "<leader>sC",
      require("telescope.builtin").commands,
      desc = "Commands",
    },
    {
      "<leader>sw",
      require("telescope.builtin").grep_string,
      desc = "Current word",
    },
    {
      "<leader>sN",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Neovim config",
    },
    {
      "<leader>gb",
      require("telescope.builtin").git_branches,
      desc = "Checkout",
    },
    {
      "<leader>gc",
      require("telescope.builtin").git_commits,
      desc = "Commits",
    },
    {
      "<leader>gs",
      require("telescope.builtin").git_status,
      desc = "Status",
    },
    {
      "<leader>ld",
      "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>lws",
      require("telescope.builtin").lsp_dynamic_workspace_symbols,
      desc = "Workspace symbols",
    },
  },
}
