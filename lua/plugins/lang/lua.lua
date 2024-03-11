return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "lua" })
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              hint = {
                enable = true,
                arrayIndex = "Disable",
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  "${3rd}/luv/library",
                  unpack(vim.api.nvim_get_runtime_file("", true)),
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
              },
              completion = {
                callSnippet = "Replace",
              },
              codeLens = {
                enable = true,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
}
