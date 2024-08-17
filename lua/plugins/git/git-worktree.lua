return {
  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("telescope").load_extension("git_worktree")

      local Worktree = require("git-worktree")

      Worktree.on_tree_change(function(op, metadata)
        if op == Worktree.Operations.Switch then
          print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
        end
      end)
    end,
    keys = {
      {
        "<leader>gwc",
        "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
        desc = "Create worktree",
      },
      {
        "<leader>gwl",
        "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
        desc = "List worktrees",
      },
    },
  },

  {
    optional = true,
    "folke/which-key.nvim",
    opts = function()
      require("which-key").add({
        { "<leader>gw", group = "+worktree" },
      })
    end,
  },
}
