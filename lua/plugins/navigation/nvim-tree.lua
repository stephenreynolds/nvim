return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	opts = {
		disable_netrw = true,
		hijack_netrw = true,
		hijack_cursor = true,
		hijack_unnamed_buffer_when_opening = false,
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
		},
		view = {
			width = 30,
			preserve_window_proportions = true,
		},
		git = {
			enable = true,
			ignore = true,
		},
		renderer = {
			root_folder_label = false,
			highlight_git = true,
			highlight_opened_files = "none",

            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = false
                }
            }
		},
	},
	keys = {
		{
			"<C-n>",
			"<cmd>NvimTreeToggle<cr>",
			desc = "File tree",
		},
	},
}
