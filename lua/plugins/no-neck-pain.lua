return {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    opts = {
            width = 120,
            buffers = {
                backgroundColor = "catppuccin",
                blend = 0.3,
                scratchPad = {
                    enabled = true,
                    location = "~/Documents/",
                },
                bo = {
                    filetype = "md",
                },
            },
    },
    keys = {
        {
            "<leader>zz",
            "<cmd>NoNeckPain<cr>",
            desc = "Center buffer",
        },
        {
            "<leader>zr",
            ":NoNeckPainResize ",
            desc = "Resize buffer width",
        },
        {
            "<leader>zu",
            "<cmd>NoNeckPainWidthUp<cr>",
            desc = "Increase buffer width",
        },
        {
            "<leader>zd",
            "<cmd>NoNeckPainWidthDown<cr>",
            desc = "Decrease buffer width",
        },
    },
}
