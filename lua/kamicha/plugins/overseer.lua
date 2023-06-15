-- overseer: A task runner and job management plugin for Neovim
return {
	"stevearc/overseer.nvim",
	depencencies = {
		{ "stevearc/dressing.nvim", optional = true },
		{ "nvim-telescope/telescope.nvim", optional = true },
		{ "rcarriga/nvim-notify", optional = true },
	},
	opts = {
		templates = {
			"builtin",
		},
		form = {
			win_opts = {
				winblend = 0,
			},
		},
		confirm = {
			win_opts = {
				winblend = 0,
			},
		},
		task_win = {
			win_opts = {
				winblend = 0,
			},
		},
	},
	keys = {
		{ "<leader>tr", "<cmd>OverseerRun<cr>", desc = "Run task" },
		{ "<leader>tt", "<cmd>OverseerToggle<cr>", desc = "Toggle tasks view" },
		{ "<leader>ta", "<cmd>OverseerTaskAction<cr>", desc = "Actions" },
		{ "<leader>tl", "<cmd>OverseerLoadBundle<cr>", desc = "Load task bundle" },
		{ "<leader>ti", "<cmd>OverseerInfo<cr>", desc = "Overseer info" },
		{ "<leader>tb", "<cmd>OverseerBuild<cr>", desc = "Task builder" },
	},
}
