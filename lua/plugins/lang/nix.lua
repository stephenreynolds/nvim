return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "nix" })
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nil_ls = {
          settings = {
            ["nil"] = {
              formatting = {
                command = { "nixfmt" },
              },
              nix = {
                maxMemoryMB = 6144,
                flake = {
                  autoArchive = true,
                  autoEvalInputs = true,
                },
              },
            },
          },
        },
      },
    },
  },
}
