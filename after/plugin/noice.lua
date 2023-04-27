require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true
		},
	},
	presets = {
		command_palette = true
	}
})

require("notify").setup({
	background_colour = "#000000",
})

vim.keymap.set("n", "<leader>sn", "<cmd>Noice telescope<cr>", { desc = "Message history" })
