return {
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {
      opleader = {
        line = "gc",
        block = "gb",
      },
      mappings = {
        -- `gcc`               -> line-comment the current line
        -- `gcb`               -> block-comment the current line
        -- `gc[count]{motion}` -> line-comment the region contained in {motion}
        -- `gb[count]{motion}` -> block-comment the region contained in {motion}
        basic = true,

        -- `gco`, `gcO`, `gcA`
        extra = true,
      },
    },
    keys = {
      { "gcc", mode = "n" },
      { "gc",  mode = "v" },
      { "gbc", mode = "n" },
      { "gb",  mode = "v" },
    },
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufEnter",
    opts = {},
    keys = {
      { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
    },
  },
}
