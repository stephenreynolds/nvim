return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {
          on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
          settings = {
            workingDirectories = { mode = "auto" },
            experimental = {
              useFlatConfig = true,
            },
          },
        },
      },
    },
  },
}
