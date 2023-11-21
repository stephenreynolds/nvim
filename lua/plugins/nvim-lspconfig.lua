return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  event = "BufEnter",
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    local function lspSymbol(name, icon)
      local hl = "DiagnosticSign" .. name
      vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
    end

    lspSymbol("Error", "󰅙")
    lspSymbol("Info", "󰋼")
    lspSymbol("Hint", "󰌵")
    lspSymbol("Warn", "")

    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
    })

    local autocmd = vim.api.nvim_create_autocmd
    local autocmd_clear = vim.api.nvim_clear_autocmds
    local augroup_highlight = vim.api.nvim_create_augroup("custom-lsp-references", { clear = true })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf

        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        if client.server_capabilities.documentHighlightProvider then
          autocmd_clear({ group = augroup_highlight, buffer = bufnr })
          autocmd("CursorHold", {
            group = augroup_highlight,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
          })
          autocmd("CursorMoved", {
            group = augroup_highlight,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
          })
        end

        vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { buffer = bufnr, remap = false, desc = "Info" })
        if client.server_capabilities.inlayHintProvider then
          vim.keymap.set("n", "<leader>lh", function()
            vim.lsp.inlay_hint(bufnr)
          end, { buffer = bufnr, remap = false, desc = "Toggle inlay hints" })
        end
        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, { buffer = bufnr, remap = false, desc = "Go to definition" })
        vim.keymap.set("n", "gD", function()
          vim.lsp.buf.declaration()
        end, { buffer = bufnr, remap = false, desc = "Go to declaration" })
        vim.keymap.set("n", "gi", function()
          vim.lsp.buf.declaration()
        end, { buffer = bufnr, remap = false, desc = "Go to implementation" })
        vim.keymap.set("n", "gr", function()
          vim.lsp.buf.declaration()
        end, { buffer = bufnr, remap = false, desc = "References" })
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, { buffer = bufnr, remap = false, desc = "Hover" })
        vim.keymap.set("n", "<leader>ld", function()
          vim.diagnostic.open_float()
        end, { buffer = bufnr, remap = false, desc = "Open diagnostics popup" })
        vim.keymap.set("n", "<leader>[d", function()
          vim.diagnostic.goto_prev()
        end, { buffer = bufnr, remap = false, desc = "Go to previous diagnostic" })
        vim.keymap.set("n", "<leader>]d", function()
          vim.diagnostic.goto_next()
        end, { buffer = bufnr, remap = false, desc = "Go to next diagnostic" })
        vim.keymap.set({ "n", "v" }, "<leader>la", function()
          vim.lsp.buf.code_action()
        end, { buffer = bufnr, remap = false, desc = "Code action" })
        vim.keymap.set("n", "<leader>ll", function()
          vim.lsp.codelens.run()
        end, { buffer = bufnr, remap = false, desc = "CodeLens" })
        vim.keymap.set("n", "<leader>rn", function()
          vim.lsp.buf.rename()
        end, { buffer = bufnr, remap = false, desc = "Rename symbol" })
        vim.keymap.set("i", "<C-h>", function()
          vim.lsp.buf.signature_help()
        end, { buffer = bufnr, remap = false, desc = "Signature help" })
      end,
    })

    lspconfig.bashls.setup({})
    lspconfig.clangd.setup(require("servers.clangd"))
    lspconfig.cssls.setup({})
    lspconfig.emmet_ls.setup({})
    lspconfig.eslint.setup({
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })
    lspconfig.gopls.setup({ settings = require("servers.gopls") })
    lspconfig.html.setup({})
    lspconfig.jsonls.setup({})
    lspconfig.lua_ls.setup({ settings = require("servers.lua_ls") })
    lspconfig.marksman.setup({})
    lspconfig.nil_ls.setup({ settings = require("servers.nil_ls") })
    lspconfig.ocamllsp.setup({})
    lspconfig.pyright.setup({})
    lspconfig.rust_analyzer.setup({
      settings = require("servers.rust-analyzer"),
      filetypes = { "rust" },
      root_dir = require("lspconfig/util").root_pattern("Cargo.toml"),
    })
    lspconfig.tsserver.setup({ settings = require("servers.tsserver") })
  end,
}
