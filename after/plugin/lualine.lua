local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

require("lualine").setup({
	options = {
		disabled_filetypes = {
			"packer",
			"Undotree",
		},
		globalstatus = true,
        theme = "catppuccin"
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "FugitiveHead", icon = "" }, { "diff", source = diff_source }, "diagnostics" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = {
			{
				require("noice").api.status.message.get_hl,
				cond = require("noice").api.status.message.has,
			},
			{
				require("noice").api.status.command.get,
				cond = require("noice").api.status.command.has,
				color = { fg = "#ff9e64" },
			},
			{
				require("noice").api.status.mode.get,
				cond = require("noice").api.status.mode.has,
				color = { fg = "#ff9e64" },
			},
			{
				require("noice").api.status.search.get,
				cond = require("noice").api.status.search.has,
				color = { fg = "#ff9e64" },
			},
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
