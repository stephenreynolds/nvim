return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "rcarriga/nvim-notify",
      optional = true,
    },
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
    },
    cmdline = {
      enabled = true,
      view = "cmdline",
    },
    hover = {
      enabled = true,
      silent = true,
    },
  },
  keys = {
    {
      "<S-Enter>",
      function()
        require("noice").redirect(vim.fn.getcmdline())
      end,
      mode = "c",
      desc = "Redirect Cmdline",
    },
    {
      "<leader>Nl",
      function()
        require("noice").cmd("last")
      end,
      desc = "Last notification",
    },
    {
      "<leader>Nh",
      function()
        require("noice").cmd("history")
      end,
      desc = "Notification history",
    },
    {
      "<leader>Na",
      function()
        require("noice").cmd("all")
      end,
      desc = "All notifications",
    },
  },
}
