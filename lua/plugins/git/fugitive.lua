return {
  "tpope/vim-fugitive",
  lazy = false,
  cmd = "Git",
  keys = {
    { "<leader>gg", "<cmd>tab Git<cr>", desc = "Fugitive" },
    { "<leader>gd", "<cmd>Git diff<cr>", desc = "Diff" },
    { "<leader>gl", "<cmd>Git blame<cr>", desc = "Blame" },
    { "<leader>gp", "<cmd>Git pull<cr>", desc = "Pull" },
    { "<leader>gP", "<cmd>Git push<cr>", desc = "Push" },
  },
}
