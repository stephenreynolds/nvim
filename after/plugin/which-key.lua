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
        L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language" },
        p = { "<cmd>BufferLineTogglePin<cr>", "Toggle pin" }
    },
    c = { "<cmd>bd<cr>", "Close buffer" },
    C = {
      name = "Copilot",
      c = { "<cmd>Copilot panel<cr>", "Panel" },
      d = { "<cmd>Copilot disable<cr>", "Disable" },
      e = { "<cmd>Copilot enable<cr>", "Enable" },
      s = { "<cmd>Copilot status<cr>", "Status" },
    },
    d = "Delete",
    y = "Copy to clipboard",
    Y = "Copy line to clipboard",
    f = "Find file",
    g = {
        name = "Git",
        g = { "<cmd>tab Git<cr>", "Fugitive" },
        d = { "<cmd>Git diff<cr>", "Diff" },
        v = { "<cmd>GV<cr>", "Commits" },
        l = { "<cmd>Git blame<cr>", "Blame" },
        w = {
            name = "Worktree",
            c = { "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "Create worktree" },
            l = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "List worktrees" },
        }
    },
    h = { "<cmd>nohl<cr", "No highlight" },
    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
        w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>Mason<cr>", "Mason Info" },
        j = { vim.diagnostic.goto_next, "Next Diagnostic" },
        k = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
        l = { vim.lsp.codelens.run, "CodeLens Action" },
        q = { vim.diagnostic.setloclist, "Quickfix" },
        r = { vim.lsp.buf.rename, "Rename" },
        R = { vim.lsp.buf.references, "References" },
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
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" }
    },
    r = {
        name = "Replace",
        w = "Replace word"
    },
    s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout" },
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
        p = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", "Colorscheme with Preview" }
    },
    u = { "<cmd>UndotreeToggle | UndotreeFocus<cr>", "Undo tree" },
    w = { "<cmd>w<cr>", "Save" },
    q = { "<cmd>q<cr>", "Quit" },
    z = {
        name = "Zen Mode",
        z = { "<cmd>ZenMode<cr>", "Toggle Zen Mode" },
    }
}, { prefix = "<leader>" })
