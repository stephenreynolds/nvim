-- leap: Neovim's answer to the mouse.
return {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
    config = function()
        require("leap").add_default_mappings()
    end,
}
