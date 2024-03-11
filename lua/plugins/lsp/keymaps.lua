local M = {}

function M.register_keymaps(client)
    vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<cr>', { buffer = bufnr, remap = false, desc = 'Info' })
    if client.server_capabilities.inlayHintProvider then
        vim.keymap.set('n', '<leader>lh', function()
            vim.lsp.inlay_hint(bufnr)
        end, { buffer = bufnr, remap = false, desc = 'Toggle inlay hints' })
    end

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-T>.
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions,
    { buffer = bufnr, remap = false, desc = 'Go to definition' })

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, remap = false, desc = 'Go to declaration' })

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations,
    { buffer = bufnr, remap = false, desc = 'Go to implementation' })

    -- Find references for the word under your cursor.
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references,
    { buffer = bufnr, remap = false, desc = 'References' })

    -- Opens a popup that displays documentation about the word under your cursor
    --  See `:help K` for why this keymap
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, remap = false, desc = 'Hover' })

    -- Format the current buffer
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { buffer = bufnr, remap = false, desc = 'Hover' })

    -- Opens a popup that displays diagnostics for the current buffer
    vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float,
    { buffer = bufnr, remap = false, desc = 'Open diagnostics popup' })

    -- Go to the previous diagnostic
    vim.keymap.set('n', '<leader>[d', vim.diagnostic.goto_prev,
    { buffer = bufnr, remap = false, desc = 'Go to previous diagnostic' })

    -- Go to the next diagnostic
    vim.keymap.set('n', '<leader>]d', vim.diagnostic.goto_next,
    { buffer = bufnr, remap = false, desc = 'Go to next diagnostic' })

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action,
    { buffer = bufnr, remap = false, desc = 'Code action' })

    vim.keymap.set('n', '<leader>ll', vim.lsp.codelens.run, { buffer = bufnr, remap = false, desc = 'CodeLens' })

    -- Rename the word under your cursor
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, remap = false, desc = 'Rename symbol' })

    -- Show the signature help for the word under your cursor
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help,
    { buffer = bufnr, remap = false, desc = 'Signature help' })
end

return M
