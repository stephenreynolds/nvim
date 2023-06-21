-- telescope-file-browser: A file browser extension for telescope.nvim.
return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("telescope").load_extension("file_browser")
    end,
    keys = {
        { "<leader>e", "<cmd>Telescope file_browser<cr>", { noremap = true, silent = true, desc = "File browser" } },
    },
}
