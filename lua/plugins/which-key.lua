return {
  "folke/which-key.nvim",
  lazy = false,
  config = function()
    local wk = require("which-key")

    wk.register({
      d = {
        name = "Debugger",
        b = "Breakpoints",
      },
      F = {
        name = "File",
        y = "Copy",
      },
      g = {
        name = "Git",
        w = "Worktree",
      },
      i = "AI",
      l = {
        name = "LSP",
        w = "Workspace",
      },
      n = "Notifications",
      r = {
        name = "Refactor",
        e = "Extract",
        i = "Inline",
      },
      s = "Search",
      ["["] = "Previous",
      ["]"] = "Next",
    }, { prefix = "<leader>", mode = "n" })

    wk.register({
      i = "AI",
      r = {
        name = "Refactor",
        e = "Extract",
      },
    }, { prefix = "<leader>", mode = "v" })
  end,
  keys = {
    {
      mode = { "n", "v" },
      "<leader>",
    },
  },
}
