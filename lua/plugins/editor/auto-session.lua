return {
  "rmagatti/auto-session",
  lazy = false,
  opts = {
    log_level = "error",
    auto_restore_enabled = true,
    auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
    auto_session_use_git_branch = true,
    cwd_change_handling = {
      post_cwd_changed_hook = function()
        require("lualine").refresh()
      end,
    },
  },
  config = function(_, opts)
    require("auto-session").setup(opts)
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  end,
}
