return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "php", "php_only" })
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "phpactor" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {},
      },
    },
  },
}
