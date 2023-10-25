return {
  "Bekaboo/deadcolumn.nvim",
  event = { "BufRead", "BufWinEnter", "BufNewFile" },
  opts = {
    scope = "visible",
    extra = {
      follow_tw = "+1",
    },
  },
}
