-- colorizer: A high-performance color highlighter.
return {
  "catgoose/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    filetypes = { "css", "scss", "html", "javascript", "lua" },
    user_default_options = {
      names = false,
    },
  },
}
