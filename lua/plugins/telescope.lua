return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {}
        },
        pickers = {
          find_files = {
            theme = "ivy"
          },
          help_tags = {
            theme = "ivy"
          }
        }
      })

      require("telescope").load_extension("fzf")

      vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
      vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
      vim.keymap.set("n", "<leader>fN", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config")
        })
      end)
      vim.keymap.set("n", "<leader>fg", require("config.telescope.multigrep").live_multigrep)
    end,
  }
}
