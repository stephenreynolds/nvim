return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "folke/neodev.nvim",
        ft = "lua",
        opts = {
          library = {
            plugins = { "nvim-dap-ui" },
            types = true,
          },
        },
      },
    },
    event = "BufEnter",
    opts = {
      setup = {},
    },
    config = function(_, opts)
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

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local bufnr = args.buf

          vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          if client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = args.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = args.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end

          vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { buffer = bufnr, remap = false, desc = "Info" })

          -- Inlay hints
          if client.server_capabilities.inlayHintProvider then
            if vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint then
              vim.keymap.set("n", "<leader>Th", function()
                local ih = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
                local value = not ih.is_enabled(bufnr)
                if type(ih) == "function" then
                  ih(bufnr, value)
                elseif type(ih) == "table" and ih.enable then
                  ih.enable(bufnr, value)
                end
              end, { buffer = bufnr, remap = false, desc = "Toggle inlay hints" })
            end
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-T>.
          vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions,
            { buffer = bufnr, remap = false, desc = "Go to definition" })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
            { buffer = bufnr, remap = false, desc = "Go to declaration" })

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations,
            { buffer = bufnr, remap = false, desc = "Go to implementation" })

          -- Find references for the word under your cursor.
          vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references,
            { buffer = bufnr, remap = false, desc = "References" })

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, remap = false, desc = "Hover" })

          -- Format the current buffer
          vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = bufnr, remap = false, desc = "Hover" })

          -- Opens a popup that displays diagnostics for the current buffer
          vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float,
            { buffer = bufnr, remap = false, desc = "Open diagnostics popup" })

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action,
            { buffer = bufnr, remap = false, desc = "Code action" })

          vim.keymap.set("n", "<leader>ll", vim.lsp.codelens.run, { buffer = bufnr, remap = false, desc = "CodeLens" })

          -- Rename the word under your cursor
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, remap = false, desc = "Rename symbol" })

          -- Show the signature help for the word under your cursor
          vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help,
            { buffer = bufnr, remap = false, desc = "Signature help" })
        end,
      })

      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end

        lspconfig[server].setup(server_opts)
      end

      -- get all the servers that are available through mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>lM", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
