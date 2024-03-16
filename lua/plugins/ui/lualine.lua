local utils = require("utils.ui")

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "SmiteshP/nvim-navic",
      dependencies = { "neovim/nvim-lspconfig" },
    },
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
        disabled_filetypes = { "packer", "Undotree", "alpha" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { "FugitiveHead", icon = "" },
        },
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1 },
          {
            "navic",
            color_correction = nil,
            navic_opts = nil,
          },
        },
        lualine_x = {
          "diagnostics",
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
          {
            -- fileformat: show only when it is not utf-8
            function()
              local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
              return ret
            end,
          },
          {
            -- encoding: show only when it is not unix
            function()
              local ret, _ = vim.bo.fileformat:gsub("^unix$", "")
              return ret
            end,
          },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = { "fugitive" },
    }
  end,
}
