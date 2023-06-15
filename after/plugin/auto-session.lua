local function get_cwd_as_name()
	local dir = vim.fn.getcwd(0)
	return dir:gsub("[^A-Za-z0-9]", "_")
end

local overseer = require("overseer")

require("auto-session").setup({
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/src", "~/Downloads", "/" },
	auto_restore_enabled = false,
	pre_save_cmds = {
		function()
			overseer.save_task_bundle(
				get_cwd_as_name(),
				-- Passing nil will use config.opts.save_task_opts. You can call list_tasks() explicitly and
				-- pass in the results if you want to save specific tasks.
				nil,
				{ on_conflict = "overwrite" } -- Overwrite existing bundle, if any
			)
		end,
	},
	-- Optionally get rid of all previous tasks when restoring a session
	pre_restore_cmds = {
		function()
			for _, task in ipairs(overseer.list_tasks({})) do
				task:dispose(true)
			end
		end,
	},
	post_restore_cmds = {
		function()
			overseer.load_task_bundle(get_cwd_as_name(), { ignore_missing = true })
		end,
	},
})
