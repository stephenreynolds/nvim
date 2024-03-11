return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "c", "cpp" })
      end
    end,
  },

  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    config = function() end,
    opts = {
      inlay_hints = {
        inline = false,
      },
      ast = {
        --These require codicons (https://github.com/microsoft/vscode-codicons)
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          keys = {
            { '<leader><leader>h', '<cmd>ClangdSwitchSourceHeader<cr>', desc = 'Switch source/header' },
          },
          root_dir = function(fname)
            return require('lspconfig.util').root_pattern(
                  'Makefile',
                  'configure.ac',
                  'configure.in',
                  'config.h.in',
                  'meson.build',
                  'meson_options.txt',
                  'build.ninja'
                )(fname)
                or require('lspconfig.util').root_pattern('compile_commands.json', 'compile_flags.txt')(fname)
                or require('lspconfig.util').find_git_ancestor(fname)
          end,
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          InlayHints = {
            Enabled = true,
            Designators = true,
            ParameterNames = true,
            DeducedTypes = true,
          },
          cmd = {
            "clangd",
            '--background-index',
            '--clang-tidy',
            '--header-insertion=iwyu',
            '--completion-style=detailed',
            '--function-arg-placeholders',
            '--fallback-style=llvm',
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          }
        },
      },
      setup = {
        clangd = function(_, opts)
          local clangd_ext_opts = require("utils").opts("clangd_extensions.nvim")
          require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
          return false
        end
      }
    },
  },

  {
    'nvim-cmp',
    opts = function(_, opts)
      table.insert(opts.sorting.comparators, 1, require('clangd_extensions.cmp_scores'))
    end,
  },

  -- Debugger
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      -- Ensure C/C++ debugger is installed
      "williamboman/mason.nvim",
      optional = true,
      opts = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          vim.list_extend(opts.ensure_installed, { "codelldb" })
        end
      end,
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters['codelldb'] then
        dap.adapters["codelldb"] = {
          type = 'server',
          host = 'localhost',
          port = '${port}',
          executable = {
            command = 'codelldb',
            args = {
              '--port',
              '${port}'
            }
          }
        }
      end
      for _, lang in ipairs({ 'c', 'cpp' }) do
        dap.configurations[lang] = {
          {
            type = 'codelldb',
            request = 'launch',
            name = 'Launch file',
            programs = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = '${workspaceFolder}',
          },
          {
            type = 'codelldb',
            request = 'attach',
            name = 'Attach to process',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
          }
        }
      end
    end
  }
}
