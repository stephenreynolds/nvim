return {
  "joshuavial/aider.nvim",
  opts = {
    auto_manage_context = true, -- automatically manage buffer context
    default_bindings = false, -- use default <leader>A keybindings
    debug = false, -- enable debug logging
    vim = true,
    ignore_buffers = {
      "^term:",
      "NeogitConsole",
      "NvimTree_",
      "neo-tree filesystem",
      "NeogitStatus",
    },
  },
  keys = {
    {
      "<leader>io",
      "<cmd>AiderOpen<cr>",
      desc = "aider: open chat",
      noremap = true,
      silent = true,
    },
    {
      "<leader>im",
      "<cmd>AiderAddModifiedFiles<cr>",
      desc = "aider: add modified files",
      noremap = true,
      silent = true,
    },
  },
}
