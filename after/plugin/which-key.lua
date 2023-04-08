local wk = require("which-key")

wk.register({
    ["["] = {
        d = "Previous Diagnostic"
    },
    ["]"] = {
        d = "Next Diagnostic"
    },
    a = "Add file to Harpoon",
    C = {
        name = "Copilot",
        c = "Panel",
        d = "Disable",
        e = "Enable",
        s = "Status",
    },
    d = "Delete",
    y = "Copy to clipboard",
    Y = "Copy line to clipboard",
    f = "Find file",
    g = {
        name = "Git",
        g = "Fugitive",
        d = "Diff",
        v = "Commits",
        l = "Blame",
        w = {
            name = "Worktree",
            c = "Create worktree",
            l = "List worktrees",
        }
    },
    l = {
        name = "LSP",
        a = "Code Action",
        d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
        w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        f = "Format",
        i = "Info",
        I = { "<cmd>Mason<cr>", "Mason Info" },
        l = "CodeLens Action",
        q = "Quickfix",
        r = {
            n = "Rename",
            r = "References"
        },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
        e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" }
    },
    N = {
        name = "Neovim",
        c = {
        }
    },
    p = {
        name = "Packer",
        c = "Compile",
        i = "Install",
        s = "Sync",
        S = "Status",
        u = "Update"
    },
    r = {
        name = "Replace",
        w = "Replace word"
    },
    s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout" },
        B = { "<cmd>Telescope buffers<cr>", "Buffers" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
        M = { "<cmd>Telescope man_pages<cr>", "Manpages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open recent file" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        p = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
            "Colorscheme with Preview" }
    },
    u = "Undo tree",
    w = { "<cmd>w<cr>", "Save" },
    q = { "<cmd>q<cr>", "Quit" },
    x = "Make executable",
    z = {
        name = "Zen Mode",
        z = "Toggle Zen Mode"
    },
    ["<space>"] = "Source file"
}, { prefix = "<leader>" })
