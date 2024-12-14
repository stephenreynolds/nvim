return {
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      log_level = "error",
      auto_restore = true,
      auto_restore_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
      use_git_branch = true,
      cwd_change_handling = {
        post_cwd_changed_hook = function()
          require("lualine").refresh()
        end,
      },
    },
    config = function(_, opts)
      require("auto-session").setup(opts)
    end,
  },

  {
    "rmagatti/session-lens",
    dependencies = {
      "rmagatti/auto-session",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      previewer = true,
    },
    keys = {
      {
        "<leader>sS",
        "<cmd>SearchSession<cr>",
        desc = "Sessions",
      },
    },
  },
}
