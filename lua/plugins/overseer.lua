-- overseer: A task runner and job management plugin for Neovim
return {
	"stevearc/overseer.nvim",
	dependencies = {
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
		{ "<leader>Tr", "<cmd>OverseerRun<cr>", desc = "Run task" },
		{ "<leader>Tt", "<cmd>OverseerToggle<cr>", desc = "Toggle tasks view" },
		{ "<leader>Ta", "<cmd>OverseerTaskAction<cr>", desc = "Actions" },
		{ "<leader>Tl", "<cmd>OverseerLoadBundle<cr>", desc = "Load task bundle" },
		{ "<leader>Ti", "<cmd>OverseerInfo<cr>", desc = "Overseer info" },
		{ "<leader>Tb", "<cmd>OverseerBuild<cr>", desc = "Task builder" },
	},
}
