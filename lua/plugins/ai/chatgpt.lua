-- ChatGPT.nvim: ChatGPT inside Neovim.
return {
	"jackMort/ChatGPT.nvim",
	depencencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		popup_input = {
			submit = "<C-s>",
		},
	},
	keys = function()
		local chatgpt = require("chatgpt")
		return {
			{
				"<leader>ii",
				"<cmd>ChatGPT<cr>",
				desc = "Chat",
			},
			{
				"<leader>ia",
				"<cmd>ChatGPTActAs<cr>",
				desc = "Act as",
			},
			{
				"<leader>ic",
				"<cmd>ChatGPTCompleteCode<cr>",
				desc = "Complete code",
			},
			{
				"<leader>ie",
				chatgpt.edit_with_instructions,
				mode = "v",
				desc = "Edit with instructions",
			},
			{
				"<leader>ig",
				"<cmd>ChatGPTRun grammar_correction<cr>",
				mode = "v",
				desc = "Grammar correction",
			},
			{
				"<leader>iT",
				"<cmd>ChatGPTRun translate<cr>",
				desc = "Translate",
			},
			{
				"<leader>ik",
				"<cmd>ChatGPTRun keyword<cr>",
				mode = "v",
				desc = "Keywords",
			},
			{
				"<leader>id",
				"<cmd>ChatGPTRun docstring<cr>",
				mode = "v",
				desc = "Docstring",
			},
			{
				"<leader>it",
				"<cmd>ChatGPTRun add_tests<cr>",
				mode = "v",
				desc = "Add tests",
			},
			{
				"<leader>io",
				"<cmd>ChatGPTRun optimize_code<cr>",
				mode = "v",
				desc = "Optimize",
			},
			{
				"<leader>is",
				"<cmd>ChatGPTRun summarize<cr>",
				mode = "v",
				desc = "Summarize",
			},
			{
				"<leader>if",
				"<cmd>ChatGPTRun fix_bugs<cr>",
				mode = "v",
				desc = "Fix bugs",
			},
			{
				"<leader>ix",
				"<cmd>ChatGPTRun explain_code<cr>",
				mode = "v",
				desc = "Explain",
			},
			{
				"<leader>ir",
				"<cmd>ChatGPTRun code_readability_analysis<cr>",
				mode = "v",
				desc = "Code readability",
			},
		}
	end,
}
