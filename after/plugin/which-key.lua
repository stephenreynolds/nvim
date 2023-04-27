local wk = require("which-key")

wk.register({
    i = {
        name = "AI",
        C = {
            name = "Copilot"
        }
    },
    d = "Debugger",
    g = {
        name = "Git",
        w = {
            name = "Worktree"
        }
    },
    l = {
        name = "LSP",
        w = {
            name = "Workspace"
        }
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
