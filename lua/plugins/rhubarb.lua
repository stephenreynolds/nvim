return {
    "tpope/vim-rhubarb",
    dependencies = "tpope/vim-fugitive",
    cmd = { "GBrowse" },
    keys = {
        {
            "<leader>gB",
            "<cmd>GBrowse<cr>",
            desc = "Open in GitHub",
        },
    }
}
