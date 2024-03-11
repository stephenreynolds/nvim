return {
  'folke/tokyonight.nvim',
  enabled = true,
  lazy = false,
  priority = 1000,
  opts = {
    style = 'night',
    transparent = true,
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      sidebars = 'transparent',
      floats = 'transparent',
    },
    lualine_bold = true,
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd.hi('Comment gui=none')
  end,
}
