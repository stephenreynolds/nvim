return {
  "folke/which-key.nvim",
  opts = {
    defaults = {
      mode = { "n", 'v' },
      ["<leader>b"] = { name = '+buffer' },
      ["<leader>g"] = { name = '+git' },
      ["<leader>i"] = { name = '+ai' },

      ["<leader>l"] = { name = '+lsp' },
      ["<leader>lw"] = { name = '+workspace' },

      ["<leader>N"] = { name = '+notifications' },
      ["<leader>r"] = { name = '+refactor' },
      ["<leader>s"] = { name = '+search' },
      ["<leader>t"] = { name = '+tabs' },
      ["<leader>T"] = { name = '+toggle' },
    }
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)
    wk.register(opts.defaults)
  end
}
