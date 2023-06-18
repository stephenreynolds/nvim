-- GitHub Copilot
return {
	"github/copilot.vim",
	lazy = false,
	config = function()
		vim.g.copilot_filetypes = {
			markdown = false,
		}

		vim.g.copilot_no_tab_map = true
		vim.g.copilot_assume_mapped = true
	end,
	keys = {
		{ "<C-f>", 'copilot#Accept("<CR>")', mode = "i", silent = true, expr = true, desc = "Accept", replace_keycodes = false },
		{ "<leader>iCc", "<cmd>Copilot panel<cr>", desc = "Panel" },
		{ "<leader>iCd", "<cmd>Copilot disable<cr>", desc = "Disable" },
		{ "<leader>iCe", "<cmd>Copilot enable<cr>", desc = "Enable" },
		{ "<leader>iCs", "<cmd>Copilot status<cr>", desc = "Status" },
	},
}
