-- auto-session: Automatically save and restore sessions.
return {
	"rmagatti/auto-session",
	opts = {
		log_level = "error",
		auto_session_suppress_dirs = { "~/", "~/src", "~/Downloads", "/" },
		auto_restore_enabled = false,
	},
}
