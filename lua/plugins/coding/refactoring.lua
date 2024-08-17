return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      prompt_func_return_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
      },
      prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
      },
    },
    config = function(_, opts)
      require("refactoring").setup(opts)
      require("telescope").load_extension("refactoring")
    end,
    keys = {
      {
        "<leader>rr",
        function()
          require("telescope").extensions.refactoring.refactors()
        end,
        mode = { "n", "v" },
        noremap = true,
        desc = "Refactor menu",
      },
      {
        "<leader>ref",
        function()
          require("refactoring").refactor("Extract Function")
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = true,
        desc = "Extract function",
      },
      {
        "<leader>reF",
        function()
          require("refactoring").refactor("Extract Function To File")
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = true,
        desc = "Extract function to file",
      },
      {
        "<leader>rev",
        function()
          require("refactoring").refactor("Extract Variable")
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = true,
        desc = "Extract variable",
      },
      {
        "<leader>reb",
        function()
          require("refactoring").refactor("Extract Block")
        end,
        mode = "n",
        noremap = true,
        silent = true,
        expr = true,
        desc = "Extract block",
      },
      {
        "<leader>reB",
        function()
          require("refactoring").refactor("Extract Block To File")
        end,
        mode = "n",
        noremap = true,
        silent = true,
        expr = true,
        desc = "Extract block to file",
      },
      {
        "<leader>iv",
        function()
          require("refactoring").refactor("Inline Variable")
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = true,
        desc = "Inline variable",
      },
      {
        "<leader>rp",
        function()
          require("refactoring").debug.print_var({ normal = true })
        end,
        noremap = true,
        mode = "n",
        desc = "Print variable",
      },
      {
        "<leader>rp",
        function()
          require("refactoring").debug.print_var({})
        end,
        noremap = true,
        mode = "v",
        desc = "Print variable",
      },
      {
        "<leader>rc",
        function()
          require("refactoring").debug.cleanup()
        end,
        noremap = true,
        mode = "n",
        desc = "Clean up generated prints",
      },
    },
  },

  {
    "folke/which-key.nvim",
    optional = true,
    opts = function()
      require("which-key").add({
        { "<leader>r", group = "+refactor" },
        { "<leader>re", group = "+extract" },
        { "<leader>ri", group = "+inline" },
      })
    end,
  },
}
