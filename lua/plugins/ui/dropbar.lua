return {
  "Bekaboo/dropbar.nvim",
  event = "VeryLazy",
  dependencies = {
    "telescope-fzf-native.nvim",
    "nvim-web-devicons",
  },
  config = function(_, opts)
    require("dropbar").setup(opts)
    vim.opt.mousemoveevent = true
    vim.ui.select = require("dropbar.utils.menu").select
  end,
}
