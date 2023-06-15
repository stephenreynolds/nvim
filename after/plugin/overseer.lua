vim.keymap.set("n", "<leader>tr", "<cmd>OverseerRun<cr>", { desc = "Run task" })
vim.keymap.set("n", "<leader>tt", "<cmd>OverseerToggle<cr>", { desc = "Toggle tasks view" })
vim.keymap.set("n", "<leader>ta", "<cmd>OverseerTaskAction<cr>", { desc = "Actions" })
vim.keymap.set("n", "<leader>tl", "<cmd>OverseerLoadBundle<cr>", { desc = "Load task bundle" })
vim.keymap.set("n", "<leader>ti", "<cmd>OverseerInfo<cr>", { desc = "Overseer info" })
vim.keymap.set("n", "<leader>tb", "<cmd>OverseerBuild<cr>", { desc = "Task builder" })

require("overseer").setup({
    templates = {
        "builtin"
    },
    form = {
        win_opts = {
            winblend = 0
        }
    },
    confirm = {
        win_opts = {
            winblend = 0
        }
    },
    task_win = {
        win_opts = {
            winblend = 0
        }
    },
})
