return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
    },
    keys = {
        {
            "<leader>u",
            "<cmd>Telescope undo<cr>",
            desc = "Undo history",
        }
    }
}
