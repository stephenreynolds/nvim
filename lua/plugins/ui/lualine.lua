local utils = require("utils.ui")

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", optional = true },
  },
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- Set an empty statusline until lualine loads
      vim.o.statusline = ""
    else
      -- Hide the statuslone on the start page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = "",
        disabled_filetypes = { "packer", "Undotree" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { "FugitiveHead", icon = "" },
          {
            "diff",
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          "diagnostics",
        },
        lualine_c = {
          require("auto-session.lib").current_session_name,
          { "filename", path = 1 },
        },
        lualine_x = {
          {
            require("noice").api.status.command.get,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.search.has()
            end,
            color = utils.fg("Statement"),
          },
          {
            require("noice").api.status.mode.get,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.search.has()
            end,
            color = utils.fg("Constant"),
          },
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = utils.fg("Debug"),
          },
          "overseer",
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = { "fugitive" },
    }
  end,
}