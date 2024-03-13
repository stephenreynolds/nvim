return {
  {
    "stevearc/overseer.nvim",
    dependencies = {
      { "dressing.nvim" },
      { "telescope.nvim" },
    },
    opts = {},
    keys = {
      {
        "<leader>oo",
        "<cmd>OverseerToggle<cr>",
        desc = "Toggle task runner"
      },
      {
        "<leader>or",
        "<cmd>OverseerRun<cr>",
        desc = "Run task"
      },
      {
        "<leader>oi",
        "<cmd>OverseerInfo<cr>",
        desc = "Task runner info"
      },
      {
        "<leader>os",
        "<cmd>OverseerSaveBundle<cr>",
        desc = "Save task bundle"
      },
      {
        "<leader>ol",
        "<cmd>OverseerLoadBundle<cr>",
        desc = "Load task bundle"
      },
      {
        "<leader>ob",
        "<cmd>OverseerBuild<cr>",
        desc = "Build"
      },
    }
  },
  {
    'folke/which-key.nvim',
    optional = true,
    opts = {
      defaults = {
        ['<leader>o'] = { name = '+task runner' },
      }
    }
  }
}
