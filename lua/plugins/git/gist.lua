return {
  {
    "Rawnly/gist.nvim",
    cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
    config = true,
    keys = {
      {
        "<leader>gGl",
        "<cmd>GistsList<cr>",
        desc = "List gists",
      },
      {
        "<leader>gGc",
        "<cmd>GistCreateFromFile<cr>",
        desc = "Create gist from file",
      },
      {
        "<leader>gGc",
        "<cmd>GistCreate<cr>",
        mode = "v",
        desc = "Create gist from selection",
      },
    },
  },

  -- `GistsList` opens the selected gif in a terminal buffer,
  -- nvim-unception uses neovim remote rpc functionality to open the gist in an actual buffer
  -- and prevents neovim buffer inception
  {
    "samjwill/nvim-unception",
    lazy = false,
    init = function()
      vim.g.unception_block_while_host_edits = true
    end,
  },

  {
    "folke/which-key.nvim",
    optional = true,
    opts = function()
      require("which-key").add({
        { "<leader>gG", group = "+gist" },
      })
    end,
  },
}
