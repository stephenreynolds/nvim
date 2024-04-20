return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nginx_language_server = {},
      },
    },
  },

  {
    "williamboman/mason.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "nginx-language-server" })
    end,
  },
}
