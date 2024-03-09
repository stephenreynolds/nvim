return {
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
      library = {
        '${3rd}/luv/library',
        unpack(vim.api.nvim_get_runtime_file('', true)),
      },
      maxPreload = 100000,
      preloadFileSize = 10000,
    },
    completion = {
      callSnippet = 'Replace',
    },
    telemetry = {
      enable = false,
    },
  },
}
