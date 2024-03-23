return {
  "akinsho/bufferline.nvim",
  -- event = "VeryLazy",
  opts = {
    options = {
      mode = "tabs",
      numbers = function(opts)
        return string.format("%s", opts.ordinal)
      end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },
  config = function(_, opts)
    vim.o.mousemoveevent = true
    vim.go.mousemoveevent = true
    require("bufferline").setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd("BufAdd", {
      callback = function()
        vim.schedule(function()
          ---@diagnostic disable-next-line: undefined-global
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
