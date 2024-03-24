return {
  "folke/tokyonight.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    transparent = true,
    terminal_colors = false,
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      sidebars = "transparent",
      floats = "transparent",
    },
    lualine_bold = true,
    on_highlights = function(hl)
      hl.LspInlayHint = {
        bg = nil,
        fg = hl.LspInlayHint.fg,
      }
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.hi("Comment gui=none")
  end,
}
