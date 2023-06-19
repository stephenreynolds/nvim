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
        local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = lsp_capabilities,
                })
            end
        })
    end
}
