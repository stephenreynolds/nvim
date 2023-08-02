return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			vimgrep_arguments = {
				"rg",
				"-L",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},

			prompt_prefix = "   ",
			selection_caret = "  ",
			entry_prefix = "  ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "ascending",

			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
					results_width = 0.8,
				},
				vertical = {
					mirror = false,
				},
				width = 0.87,
				height = 0.80,
				preview_cutoff = 120,
			},
		},
        extensions = {
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
	},
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.load_extension("fzf")
    end,
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
			"<leader>sb",
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
	},
}