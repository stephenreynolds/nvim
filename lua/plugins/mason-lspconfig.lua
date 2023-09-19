return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
        ensure_installed = {
            "tsserver",
            "eslint",
            "lua_ls",
            "rust_analyzer",
            "clangd",
            "gopls",
            "golangci_lint_ls",
            "emmet_ls",
            "jsonls",
            "html",
            "marksman",
            "sqlls",
            "taplo",
            "tailwindcss",
            "yamlls",
            "dockerls",
            "docker_compose_language_service",
        },
        automatic_installation = true,
    },
    config = function(_, opts)
        local mason_lspconfig = require("mason-lspconfig")
        require("mason").setup()
        mason_lspconfig.setup(opts)

        local lspconfig = require("lspconfig")

        lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({})
            end,
            ["clangd"] = function()
                lspconfig.clangd.setup({ settings = require("servers.clangd") })
            end,
            ["gopls"] = function()
                lspconfig.gopls.setup({ settings = require("servers.gopls") })
            end,
            ["lua_ls"] = function()
                lspconfig.lua_ls.setup({ settings = require("servers.lua_ls") })
            end,
            ["nil_ls"] = function()
                lspconfig.nil_ls.setup({ settings = require("servers.nil_ls") })
            end,
            ["rust_analyzer"] = function()
                lspconfig.rust_analyzer.setup({
                    settings = require("servers.rust-analyzer"),
                    filetypes = { "rust" },
                    root_dir = require("lspconfig/util").root_pattern("Cargo.toml"),
                })
            end,
            ["tsserver"] = function()
                lspconfig.tsserver.setup({ settings = require("servers.tsserver") })
            end,
            ["tailwindcss"] = function()
                lspconfig.tailwindcss.setup()
            end,
        })

        lspconfig.nil_ls.setup({ settings = require("servers.nil_ls") })
    end,
}
