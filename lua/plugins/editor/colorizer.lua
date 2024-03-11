-- colorizer: A high-performance color highlighter.
return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    "css",
    "scss",
    html = { names = false },
    javascript = { names = false },
    lua = { names = false },
  },
}
