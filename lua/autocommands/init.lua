local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local hl_groups = {
			"Normal",
			"NormalFloat",
			"SignColumn",
			"NormalNC",
			"TelescopeNormal",
			"TelescopeBorder",
			"NvimTreeNormal",
			"EndOfBuffer",
			"MsgArea",
		}
		for _, name in ipairs(hl_groups) do
			vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
		end
	end,
})

-- Highlight on yank
local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- Remove trailing whitespace on write
local kamicha_group = augroup("kamicha", {})
autocmd({ "BufWritePre" }, {
	group = kamicha_group,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})
