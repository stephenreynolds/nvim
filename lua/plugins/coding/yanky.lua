return {
  "gbprod/yanky.nvim",
  dependencies = { "kkharji/sqlite.lua" },
  opts = {
    highlight = { timer = 40 },
    ring = { storage = jit.os:find("Windows") and "shada" or "sqlite" },
  },
  config = function(_, opts)
    vim.g.sqlite_clib_path = os.getenv("NVIM_SQLITE_PATH") .. "/lib/libsqlite3.so"
    require("yanky").setup(opts)
  end,
  keys = {
    {
      "<leader>p",
      function()
        require("telescope").extensions.yank_history.yank_history({})
      end,
      desc = "Yank history",
    },
    { "y",  "<Plug>(YankyYank)",                      mode = { "n", "x" },                           desc = "Yank text" },
    { "p",  "<Plug>(YankyPutAfter)",                  mode = { "n", "x" },                           desc = "Put yanked text after cursor" },
    { "P",  "<Plug>(YankyPutBefore)",                 mode = { "n", "x" },                           desc = "Put yanked text before cursor" },
    { "gp", "<Plug>(YankyGPutAfter)",                 mode = { "n", "x" },                           desc = "Put yanked text after selection" },
    { "gP", "<Plug>(YankyGPutBefore)",                mode = { "n", "x" },                           desc = "Put yanked text before selection" },
    { "[y", "<Plug>(YankyCycleForward)",              desc = "Cycle forward through yank history" },
    { "]y", "<Plug>(YankyCycleBackward)",             desc = "Cycle backward through yank history" },
    { "]p", "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put indented after cursor (linewise)" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put indented before cursor (linewise)" },
    { "]P", "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put indented after cursor (linewise)" },
    { "[P", "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put indented before cursor (linewise)" },
    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)",  desc = "Put and indent right" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)",   desc = "Put and indent left" },
    { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
    { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)",  desc = "Put before and indent left" },
    { "=p", "<Plug>(YankyPutAfterFilter)",            desc = "Put after applying a filter" },
    { "=P", "<Plug>(YankyPutBeforeFilter)",           desc = "Put before applying a filter" },
  },
}
