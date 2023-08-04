return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Oil",
    opts = {
        float = {
            win_options = {
                winblend = 0
            }
        }
    },
    keys = {
        {
            "<leader>e",
            "<cmd>Oil --float<cr>",
            desc = "Open file explorer",
        }
    },
}
