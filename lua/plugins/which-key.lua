-- Which Key: Popup that displays possible key bindings of the command you started typing.
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.register({
			i = {
				name = "AI",
				C = {
					name = "Copilot",
				},
			},
			d = "Debugger",
			g = {
				name = "Git",
				w = {
					name = "Worktree",
				},
			},
			l = {
				name = "LSP",
				w = {
					name = "Workspace",
				},
			},
			r = {
				name = "Refactor",
				e = "Extract",
				i = "Inline",
			},
			s = {
				name = "Search",
			},
			t = {
				name = "Tests",
			},
			T = {
				name = "Task Runner",
			},
		}, { prefix = "<leader>" })
	end,
}
