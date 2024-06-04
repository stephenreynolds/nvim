return {
  "rachartier/tiny-devicons-auto-colors.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  config = function()
    local scheme = require("tokyonight.colors").default
    local palette = {}

    for _, v in pairs(scheme) do
      if type(v) == "string" and string.sub(v, 1, 1) == "#" then
        table.insert(palette, v)
      end
    end

    require("tiny-devicons-auto-colors").setup({ colors = palette })
  end,
}
