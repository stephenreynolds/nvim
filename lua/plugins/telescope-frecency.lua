return {
  "nvim-telescope/telescope-frecency.nvim",
  dependencies = { "kkharji/sqlite.lua" },
  event = "VimEnter",
  config = function()
    vim.g.sqlite_clib_path = os.getenv("NVIM_SQLITE_PATH") .. "/lib/libsqlite3.so"
    require("telescope").load_extension("frecency")
  end,
}
