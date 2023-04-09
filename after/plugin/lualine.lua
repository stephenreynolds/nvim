require("lualine").setup {
    options = {
        disabled_filetypes = {
            "packer",
            "Undotree"
        },
        globalstatus = true
    },
    sections = {
        lualine_c = { {"filename", path = 1} }
    }
}
