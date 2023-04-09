local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

require("lualine").setup {
    options = {
        disabled_filetypes = {
            "packer",
            "Undotree"
        },
        globalstatus = true
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { {"FugitiveHead", icon = ""}, {"diff", source = diff_source}, "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    }
}
