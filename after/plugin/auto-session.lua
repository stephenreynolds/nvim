require("auto-session").setup {
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/src", "~/Downloads", "/" },
    auto_restore_enabled = false
}
