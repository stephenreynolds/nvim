return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "elixir",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = {
          cmd = { "elixir-ls" },
          autoBuild = true,
          dialyzerEnabled = true,
          suggestSpecs = true,
          enableTestLenses = true,
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "elixir-ls" })
    end,
  },
}
