# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a modular Neovim configuration written entirely in Lua, using the Lazy.nvim plugin manager. The configuration is optimized for multi-language development with a focus on systems languages (Rust, C/C++) and web technologies (TypeScript, JavaScript).

## Dependencies

- Neovim (v0.9+)
- Git
- ripgrep
- fzf
- make
- gcc
- A Nerd Font (optional, for icons)

## Architecture

### Entry Point and Loading Order

The configuration loads in this sequence (see `init.lua`):
1. Core options (`lua/config/options.lua`)
2. Plugin manager setup (`lua/config/lazy.lua`)
3. Auto-commands (`lua/config/autocmds.lua`)
4. Keymaps (`lua/config/keymaps.lua`)

### Directory Structure

- `lua/config/` - Core configuration (options, lazy setup, keymaps, autocmds)
- `lua/plugins/` - Plugin specifications organized by category (ai, coding, colorscheme, database, debugging, editor, git, http, lang, linting, lsp, navigation, testing, ui, tasks)
- `lua/utils/` - Utility functions and helper modules
- `after/ftplugin/` - Language-specific settings applied after filetype detection
- `nix/` - Nix package configuration files
- `lazy-lock.json` - Frozen plugin versions for reproducibility

### Plugin Organization

Each plugin gets its own file within a category directory in `lua/plugins/`. This makes it easy to enable/disable features or understand dependencies. Plugins are lazy-loaded strategically to minimize startup time.

The main categories are imported in `lua/config/lazy.lua`:
- ai, coding, colorscheme, database, debugging, editor, git, http, lang, linting, lsp, navigation, testing, ui, tasks

### Key Architectural Decisions

1. **Plugin-per-file approach**: Each plugin has its own file in a category directory for modularity
2. **Language configuration split**: LSP setup is in `plugins/lsp/` and `plugins/lang/`, while filetype-specific settings are in `after/ftplugin/`
3. **Lazy loading strategy**: Most plugins lazy-load on events or file types to minimize startup time
4. **NixOS awareness**: Mason.nvim has special handling to avoid installing tools that should come from Nix packages

## Common Commands

### Formatting

- Use `<leader>lff` to format the current buffer
- Use `<leader>lft` to toggle format on save globally
- Use `<leader>lfb` to toggle format on save for current buffer
- Commands: `:Format`, `:FormatEnable`, `:FormatDisable`, `:FormatToggle`

Formatting is handled by Conform.nvim with async fallback for slow formatters.

### Testing

Testing is managed through Neotest with multiple language adapters:

- `<leader>tt` - Run test file
- `<leader>tT` - Run all tests
- `<leader>tr` - Run nearest test
- `<leader>ts` - Toggle test summary
- `<leader>to` - Show test output
- `<leader>td` - Debug nearest test

Supported test frameworks:
- Rust (via rustaceanvim)
- Go (neotest-go)
- Zig (neotest-zig)
- PHP (neotest-pest)

### Task Running

Overseer task runner provides custom task execution:

- `<leader>oo` - Toggle task runner
- `<leader>or` - Run task
- `<leader>ob` - Build command

### Debugging

DAP (Debug Adapter Protocol) is configured with nvim-dap and dap-ui:

- Language-specific adapters:
  - CODELLDB for Rust and C/C++
  - pwa-node for JavaScript/TypeScript
- Virtual text display of variable values during debugging

### LSP Operations

Common LSP keymaps (leader key is `<Space>`):

- `gd` - Go to definition (Telescope)
- `gr` - Find references (Telescope)
- `K` - Hover documentation
- `<leader>la` - Code action
- `<leader>rn` - Rename symbol
- `<leader>ld` - Show diagnostics
- `]d/[d` - Next/previous diagnostic
- `]e/[e` - Next/previous error

## Language-Specific Details

### Rust

Configured via `rustaceanvim` with Rust Analyzer:
- Debugger: CODELLDB
- Cargo.toml integration via `crates.nvim`
- Local leader key: `<\>`
- Custom keymaps: `<localleader>d/r/t/m/e/D/c/s/p/M` for Rust-specific LSP commands

### C/C++

Configured via `clangd_extensions`:
- Clangd LSP with background indexing and clang-tidy
- Header insertion (IWYU)
- Debugger: CODELLDB
- Keymap: `<localleader>h` to switch between source/header files

### TypeScript/JavaScript

- ts_ls (formerly tsserver) with comprehensive inlay hints
- Prettier/Prettierd for formatting
- pwa-node debugger
- Neotest support

## Completion and Snippets

- **Completion engine**: blink.cmp (replacing nvim-cmp)
  - Sources: LSP, path, snippets, lazydev
  - Ctrl+Y to accept completions
  - Auto-imports enabled
- **Snippet engine**: LuaSnip with friendly-snippets
  - Build step for regex support (except Windows)

## Important Configuration Values

- **Leader keys**: `<Space>` (main), `<\>` (local)
- **Indentation**: 4 spaces
- **Undo history**: 10,000 levels, persisted to `~/.vim/undodir`
- **Search**: Uses ripgrep (rg) instead of grep
- **Line numbers**: Relative with visual feedback
- **Disabled built-in plugins**: gzip, tar, tohtml, tutor, zip (for performance)

## When Modifying This Configuration

1. **Adding plugins**: Create a new file in the appropriate `lua/plugins/` category directory
2. **Changing keymaps**: Edit `lua/config/keymaps.lua` or language-specific files in `after/ftplugin/`
3. **LSP configuration**: Check `lua/plugins/lsp/` for server-specific setup
4. **Format on save**: Uses Conform.nvim - config in `lua/plugins/coding/conform.lua`
5. **After making changes**: Run `:Lazy sync` to update plugins, or restart Neovim

## Treesitter

Provides syntax highlighting, indentation, and textobjects:
- Incremental selection with `Ctrl+Space`
- Motion keymaps: `]m`, `]]`, `[m`, `[[` for function/class navigation
- Textobject keymaps for functions, classes, parameters
- Auto-tagging for HTML/JSX
