local wk = require("which-key")

wk.register({
    a = "Add file to Harpoon",
    b = {
        name = "Buffers",
        j = { "<cmd>BufferLinePick<cr>", "Jump" },
        f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
        b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
        n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
        e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close" },
        h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
        l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
        D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
        L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language" }
    },
    c = { "<cmd>bd<cr>", "Close buffer" },
    f = "Find file",
    h = { "<cmd>nohl<cr", "No highlight" },
    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" }
    },
    u = "Undo tree",
    w = { "<cmd>w<cr>", "Save" },
    q = { "<cmd>q<cr>", "Quit" }
}, { prefix = "<leader>" })

