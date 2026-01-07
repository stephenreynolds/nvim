# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Modular Neovim configuration in Lua using Lazy.nvim. Optimized for systems languages (Rust, C/C++) and web technologies (TypeScript, JavaScript).

## Architecture

### Loading Order

1. Core options (`lua/config/options.lua`)
2. Plugin manager setup (`lua/config/lazy.lua`)
3. Auto-commands (`lua/config/autocmds.lua`)
4. Keymaps (`lua/config/keymaps.lua`)

### Plugin Organization

Each plugin gets its own file in a category directory under `lua/plugins/`. Categories imported in `lua/config/lazy.lua`:
- ai, coding, colorscheme, database, debugging, editor, git, http, lang, linting, lsp, navigation, tasks, testing, ui

### Key Patterns

1. **Plugin-per-file**: Each plugin in its own file for modularity
2. **Language config split**: LSP in `plugins/lsp/` and `plugins/lang/`, filetype settings in `after/ftplugin/`
3. **Lazy loading**: Most plugins load on events or filetypes
4. **NixOS awareness**: Mason.nvim avoids installing tools that should come from Nix

## Key Bindings

**Leader keys**: `<Space>` (leader), `\` (localleader)

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition (Telescope) |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Find references |
| `K` | Hover documentation |
| `<leader>la` | Code action |
| `<leader>ll` | Run CodeLens |
| `<leader>rn` | Rename symbol |
| `<leader>ld` | Open diagnostics popup |
| `<leader>Th` | Toggle inlay hints |
| `]d/[d` | Next/prev diagnostic |
| `]e/[e` | Next/prev error |

### Formatting (Conform.nvim)

| Key/Command | Action |
|-------------|--------|
| `<leader>lff` | Format buffer |
| `<leader>lft` | Toggle format on save (global) |
| `<leader>lfb` | Toggle format on save (buffer) |
| `:Format` | Format buffer |
| `:FormatToggle` | Toggle global, `:FormatToggle!` for buffer |

### Testing (Neotest)

| Key | Action |
|-----|--------|
| `<leader>tt` | Run test file |
| `<leader>tT` | Run all tests |
| `<leader>tr` | Run nearest test |
| `<leader>tl` | Run last test |
| `<leader>ts` | Toggle summary |
| `<leader>to` | Show output |
| `<leader>tO` | Toggle output panel |
| `<leader>tS` | Stop tests |
| `<leader>td` | Debug nearest test |

### Task Running (Overseer)

| Key | Action |
|-----|--------|
| `<leader>oo` | Toggle task runner |
| `<leader>or` | Run task |
| `<leader>ob` | Build |
| `<leader>oi` | Task runner info |
| `<leader>os` | Save task bundle |
| `<leader>ol` | Load task bundle |

## Language-Specific

### Rust

- Plugin: `rustaceanvim` with Rust Analyzer
- Debugger: CODELLDB
- Cargo.toml: `crates.nvim`
- Keymaps: `<localleader>d/r/t/m/e/D/c/s/p/M`

### C/C++

- Plugin: `clangd_extensions`
- Features: background indexing, clang-tidy, IWYU
- Debugger: CODELLDB
- Keymap: `<localleader>h` to switch source/header

### TypeScript/JavaScript

- LSP: ts_ls with inlay hints
- Formatter: prettierd/prettier
- Debugger: pwa-node

## Completion (blink.cmp)

- Sources: LSP, path, snippets, lazydev
- `<C-y>` to accept (auto-imports if supported)
- `<C-space>` to open menu/docs
- `<C-n>/<C-p>` to navigate
- Snippet engine: LuaSnip

## Configuration Values

- Indentation: 4 spaces
- Undo: 10,000 levels, persisted to `~/.vim/undodir`
- Search: ripgrep (`rg --vimgrep`)
- Line numbers: relative

## Modifying This Config

1. **Add plugin**: Create file in appropriate `lua/plugins/<category>/` directory
2. **Edit keymaps**: `lua/config/keymaps.lua` or `after/ftplugin/<lang>.lua`
3. **LSP config**: `lua/plugins/lsp/` for servers, `lua/plugins/lang/` for language-specific
4. **Format config**: `lua/plugins/linting/conform.lua`
5. **Apply changes**: `:Lazy sync` or restart Neovim
