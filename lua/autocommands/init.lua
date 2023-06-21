local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

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
