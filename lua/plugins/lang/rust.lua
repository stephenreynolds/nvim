return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "ron", "rust", "toml" })
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    dependencies = {
      {
        "vxpm/ferris.nvim",
        opts = {
          create_commands = false,
        },
      },
    },
    version = "^4", -- Recommended
    ft = { "rust" },
    opts = {
      tools = {
        test_executor = "background",
      },
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>la", function()
            vim.cmd.RustLsp("codeAction")
          end, { desc = "Code Action", buffer = bufnr })

          vim.keymap.set("n", "<localleader>d", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Debuggables", buffer = bufnr })

          vim.keymap.set("n", "<localleader>r", function()
            vim.cmd.RustLsp("runnables")
          end, { desc = "Runnables", buffer = bufnr })

          vim.keymap.set("n", "<localleader>t", function()
            vim.cmd.RustLsp("testables")
          end, { desc = "Testables", buffer = bufnr })

          vim.keymap.set("n", "<localleader>m", function()
            vim.cmd.RustLsp("expandMacro")
          end, { desc = "Expand macro", buffer = bufnr })

          vim.keymap.set("n", "<localleader>e", function()
            vim.cmd.RustLsp("explainError")
          end, { desc = "Explain error", buffer = bufnr })

          vim.keymap.set("n", "<localleader>D", function()
            vim.cmd.RustLsp("renderDiagnostic")
          end, { desc = "Render diagnostic", buffer = bufnr })

          vim.keymap.set("n", "<localleader>c", function()
            vim.cmd.RustLsp("openCargo")
          end, { desc = "Open Cargo.toml", buffer = bufnr })

          vim.keymap.set("n", "<localleader>s", function()
            vim.cmd.RustLsp("openDocs")
          end, { desc = "Open docs.rs for symbol", buffer = bufnr })

          vim.keymap.set("n", "<localleader>p", function()
            vim.cmd.RustLsp("parentModule")
          end, { desc = "Parent module", buffer = bufnr })

          vim.keymap.set("n", "<localleader>M", function()
            require("ferris.methods.view_memory_layout")()
          end, { desc = "Memory layout", buffer = bufnr })
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            -- Add clippy lints for Rust.
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts or {})
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {},
        taplo = {
          keys = {
            {
              "K",
              function()
                if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                  require("crates").show_popup()
                else
                  vim.lsp.buf.hover()
                end
              end,
              desc = "Show Crate Documentation",
            },
          },
        },
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },

  -- Extend auto completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        opts = {
          null_ls = {
            enabled = true,
            name = "crates.nvim",
          },
        },
      },
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "crates" })
    end,
  },

  {
    "williamboman/mason.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "codelldb" })
    end,
  },

  {
    "nvim-neotest/neotest",
    optional = true,
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      vim.list_extend(opts.adapters, {
        require("rustaceanvim.neotest"),
      })
    end,
  },
}
