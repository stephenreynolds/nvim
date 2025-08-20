local utils = require("utils.ui")

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", optional = true },
    "folke/tokyonight.nvim",
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
          { "filename", path = 1 },
        },
        lualine_x = {
          -- {
          --   require("noice").api.statusline.mode.get,
          --   cond = require("noice").api.statusline.mode.has,
          --   color = { fg = "#ff9e64" },
          -- },
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
            -- tab size
            function()
              return "Spaces: " .. vim.bo.shiftwidth
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
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = { "fugitive" },
    }
  end,
}
