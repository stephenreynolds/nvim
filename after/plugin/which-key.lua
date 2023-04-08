local wk = require("which-key")

wk.register({
    b = {
        name = "Buffer"
    },
    C = {
        name = "Copilot"
    },
    d = "Debugger",
    g = {
        name = "Git",
        w = {
            name = "Worktree"
        }
    },
    l = {
        name = "LSP"
    },
    p = {
        name = "Packer"
    },
    r = {
        name = "Replace"
    },
    s = {
        name = "Search"
    }
}, { prefix = "<leader>" })
