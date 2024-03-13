return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  opts = {
    keymaps = {
      normal = "s",
      normal_cur = "ss",
      normal_line = "S",
      normal_cur_line = "SS",
    },
  },
  config = function(_, opts)
    require("nvim-surround").setup(opts)
  end,
}
