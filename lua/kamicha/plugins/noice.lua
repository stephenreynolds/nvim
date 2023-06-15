-- noice: Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
return {
    "folke/noice.nvim",
    depencencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    opts = {
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true
            },
        },
        presets = {
            command_palette = true
        }
    },
    keys = {
        { "<leader>sn", "<cmd>Noice telescope<cr>", desc = "Message history" }
    }
}
