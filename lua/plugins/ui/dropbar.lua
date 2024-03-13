return {
  "Bekaboo/dropbar.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", optional = true },
  },
  config = function(_, opts)
    require("dropbar").setup(opts)
    vim.opt.mousemoveevent = true
    vim.ui.select = require("dropbar.utils.menu").select
  end,
}
