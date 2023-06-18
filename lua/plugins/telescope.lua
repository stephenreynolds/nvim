-- Telescope: Highly extendable fuzzy finder.
return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.x",
	depencencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>f",
			"<cmd>Telescope find_files<cr>",
			desc = "Find file",
		},
		{
			"<leader>sf",
			"<cmd>Telescope find_files<cr>",
			desc = "Find file",
		},
		{
			"<leader>sB",
			"<cmd>Telescope buffers<cr>",
			desc = "Buffers",
		},
		{
			"<leader>sc",
			"<cmd>Telescope colorscheme<cr>",
			desc = "Colorscheme",
		},
		{
			"<leader>sh",
			"<cmd>Telescope help_tags<cr>",
			desc = "Find Help",
		},
		{
			"<leader>sH",
			"<cmd>Telescope highlights<cr>",
			desc = "Find highlight groups",
		},
		{
			"<leader>sM",
			"<cmd>Telescope man_pages<cr>",
			desc = "Manpages",
		},
		{
			"<leader>sr",
			"<cmd>Telescope oldfiles<cr>",
			desc = "Open recent file",
		},
		{
			"<leader>sR",
			"<cmd>Telescope registers<cr>",
			desc = "Registers",
		},
		{
			"<leader>st",
			"<cmd>Telescope live_grep<cr>",
			desc = "Text",
		},
		{
			"<leader>sk",
			"<cmd>Telescope keymaps<cr>",
			desc = "Keymaps",
		},
		{
			"<leader>sC",
			"<cmd>Telescope commands<cr>",
			desc = "Commands",
		},
		{
			"<leader>sp",
			"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true},<cr>",
			desc = "Colorscheme with preview",
		},

		{
			"<leader>gb",
			"<cmd>Telescope git_branches<cr>",
			desc = "Checkout",
		},
		{
			"<leader>ld",
			"<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>lI",
			"<cmd>Mason<cr>",
			desc = "Mason Info",
		},
		{
			"<leader>ls",
			"<cmd>Telescope lsp_document_symbols<cr>",
			desc = "Document symbols",
		},
		{
			"<leader>lws",
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			desc = "Workspace symbols",
		},
		{
			"<leader>e",
			"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
			desc = "File browser",
		},
	},
}