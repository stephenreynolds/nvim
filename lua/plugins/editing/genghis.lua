return {
    "chrisgrieser/nvim-genghis",
    dependencies = "stevearc/dressing.nvim",
    keys = {
        {
            "<leader>Fyp",
            function()
                require("genghis").copyFilepath()
            end,
            desc = "Copy file path",
        },
        {
            "<leader>Fyn",
            function()
                require("genghis").copyFilename()
            end,
            desc = "Copy file name",
        },
        {
            "<leader>Fx",
            function()
                require("genghis").chmodx()
            end,
            desc = "Make executable",
        },
        {
            "<leader>Fr",
            function()
                require("genghis").renameFile()
            end,
            desc = "Rename file",
        },
        {
            "<leader>Fm",
            function()
                require("genghis").moveAndRenameFile()
            end,
            desc = "Move and rename file",
        },
        {
            "<leader>Fn",
            function()
                require("genghis").createNewFile()
            end,
            desc = "Create new file",
        },
        {
            "<leader>Fd",
            function()
                require("genghis").duplicateFile()
            end,
            desc = "Duplicate file",
        },
        {
            "<leader>FD",
            function()
                require("genghis").trashFile({ trashLocation = "~/.Trash" })
            end,
            desc = "Trash file",
        },
        {
            "<leader>FM",
            function()
                require("genghis").moveSelectionToNewFile()
            end,
            mode = "x",
            desc = "Move selection to new file",
        },
    },
}
