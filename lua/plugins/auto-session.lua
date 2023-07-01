return {
	"rmagatti/auto-session",
	lazy = false,
	opts = {
		log_level = "error",
		auto_restore_enabled = false,
		cwd_change_handling = {
			post_cwd_changed_hook = function()
				require("lualine").refresh()
			end,
		},
	},
}
