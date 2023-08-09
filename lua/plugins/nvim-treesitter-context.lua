return {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufEnter",
    keys = {
        {
            "[c",
            function() require("treesitter-context").go_to_context() end,
            mode = "n",
            silent = true,
            desc = "Go to context",
        },
    },
}
