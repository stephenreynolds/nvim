return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "luvit-meta/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      require("lspconfig").lua_ls.setup({
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
      })
    end,
  }
}
