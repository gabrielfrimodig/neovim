# Neovim

My personal Lua-based Neovim configuration. **lazy.nvim** manages plugins; `lazy-lock.json` records their exact versions.

Used on **Neovim 0.12.6 on macOS (Apple Silicon)**. Other platforms have not been verified.

<div align="center">
    <img width="760px" src="https://i.imgur.com/71UH5Y9.png" />
</div>

## Features

| Area | Plugins and behavior |
|---|---|
| Search | Telescope for files, text, buffers, help, and File Browser |
| Navigation | NvimTree and four Harpoon shortcuts |
| Completion | nvim-cmp with LSP, LuaSnip, paths, buffer words, and command-line completion |
| Language support | nvim-lspconfig through Neovim's `vim.lsp.config` and `vim.lsp.enable` |
| Syntax | Treesitter highlighting, text objects, and function navigation |
| Git and history | Gitsigns and Undotree with persistent undo history |
| Writing | vim-markdown, Markdown Preview, and VimTeX |
| Editing | Autopairs and Which-key for discovering shortcuts |
| Appearance | lualine, indent-blankline, Colorizer, nvim-notify, and nvim-web-devicons |

## Requirements

- **Neovim 0.12+** for this configuration. Use the tested version above as a reference; future plugin updates may change requirements.
- **Git** and an internet connection for installation and updates.
- **ripgrep** (`rg`) for Telescope text search. **fd** is optional for file search.
- **tree-sitter CLI 0.26.1+**, a **C compiler**, **curl**, and **tar** to install Treesitter parsers. Install the CLI through a system package manager or official binaries, rather than npm, as required by the Treesitter plugin.
- A terminal with **true color** support. A **Nerd Font** is recommended for icons.

Language servers, LaTeX tools, and PDF viewers must be installed separately as needed. They are not included in this repository.

## Installation

### 1. Clone the configuration

Move any existing Neovim configuration aside and back up its data first. Then clone into Neovim's configuration directory, normally `~/.config/nvim` on macOS/Linux:

```sh
git clone https://github.com/gabrielfrimodig/neovim.git ~/.config/nvim
nvim
```

If `XDG_CONFIG_HOME` is set, use `$XDG_CONFIG_HOME/nvim` instead.

Lazy bootstraps itself on first launch and installs missing plugins. Wait for installation to finish, then restart Neovim. Use `:Lazy` to inspect status and build errors. Packer is not required.

### 2. Install parsers

Parser binaries are local installation files and are **not included** in Git. The configuration enables available parsers but does not automatically install missing languages. To install the same set used during verification, run inside Neovim:

```vim
:TSInstall lua vim vimdoc query python javascript typescript tsx html css json markdown markdown_inline java bash c cpp rust yaml toml
```

Wait for installation to finish, then reopen the file or restart Neovim. Add languages with `:TSInstall language`.

### 3. Install language servers

The following configurations are enabled when their executable is available in Neovim's `PATH` at startup:

| Language | LSP configuration | Executable |
|---|---|---|
| Lua | `lua_ls` | `lua-language-server` |
| Python | `pyright` | `pyright-langserver` |
| JavaScript / TypeScript | `ts_ls` | `typescript-language-server` |
| C / C++ | `clangd` | `clangd` |
| Rust | `rust_analyzer` | `rust-analyzer` |
| LaTeX | `texlab` | `texlab` |
| HTML | `html` | `vscode-html-language-server` |
| CSS | `cssls` | `vscode-css-language-server` |
| JSON | `jsonls` | `vscode-json-language-server` |
| Bash | `bashls` | `bash-language-server` |
| Java | `jdtls` | `jdtls` |

Install servers for the languages you use, including their runtime dependencies. The TypeScript server requires TypeScript; Java requires a compatible JDK. HTML, CSS, and JSON servers are available through `vscode-langservers-extracted`.

Restart Neovim after installation and run `:checkhealth vim.lsp`. Finding an executable enables its configuration; attachment also depends on the file type and project root. Mason is not included, and language servers are not downloaded automatically.

### 4. Check the installation

```vim
:checkhealth
:checkhealth lazy
:checkhealth nvim-treesitter
:checkhealth vim.lsp
```

## Essential shortcuts

`<leader>` is **Space** and `<localleader>` is **backslash** (`\`). Press Space and wait to open the Which-key menu. Unless noted otherwise, mappings apply in normal mode.

| Keys | Action |
|---|---|
| `Space fk` / `Space ?` | Search all mappings / show local mappings |
| `ff` / `fg` / `fb` / `fh` | Search files / text / buffers / help |
| `Space e` / `Space fe` | NvimTree / Telescope File Browser |
| `Space ha` / `Space hm` | Add file to Harpoon / open Harpoon menu |
| `Space h1` … `Space h4` | Jump to Harpoon file 1 … 4 |
| `ss` / `sv` | Split horizontally / vertically |
| `Ctrl+h/j/k/l` | Move between windows |
| `Tab` / `Shift+Tab` | Next / previous buffer |
| `ii` in insert mode | Return to normal mode |
| `Esc` | Clear search highlighting |
| `Space u` | Show undo history |
| `gd` / `gr` / `K` | Definition / references / documentation through an attached LSP |
| `Space rn` / `Space ca` | Rename symbol / code actions through LSP |
| `Space cf` | Format through LSP if supported by the server |
| `]d` / `[d` / `Space cd` | Next diagnostic / previous diagnostic / details |
| `]h` / `[h` / `Space hp` | Next Git hunk / previous Git hunk / preview |
| `Space hs` / `Space hr` | Stage / **reset** current Git hunk |
| `Space mp` | Toggle Markdown preview in a Markdown buffer |
| `Space ft` | Select a color scheme for the current session |

LSP mappings are installed when a server attaches. Buffer-local plugin mappings can override global ones: `]h` navigates headings in Markdown, and `Ctrl+k` shows file information in NvimTree. The `ff`/`fg` and `ss`/`sv` mappings also affect Vim's built-in `f` and `s` commands.

See the [complete cheat sheet](docs/neovim-cheatsheet.md) for completion, snippets, Treesitter text objects, plugin-specific mappings, and VimTeX commands.

## Themes

The theme [Seashell]((https://github.com/gabrielfrimodig/seashell.nvim)) is loaded when `~/dev/seashell.nvim` exists. Its source is a seperate repository.  Choose an installed scheme with `Space ft` or `:colorscheme name`. For a persistent choice, configure the theme in `lua/specs/ui.lua` and disable the Seashell specification if it would otherwise override your selection.

## Structure

```text
init.lua                     Leader keys and loading order
lazy-lock.json               Locked plugin versions
lua/
  settings.lua               Editor options without plugin dependencies
  keymaps.lua                Global keyboard mappings
  config/
    lazy.lua                 Lazy bootstrap and settings
  specs/
    completion.lua           cmp, completion sources, and LuaSnip
    editor.lua               Navigation, Git, Undotree, Autopairs, Which-key
    lsp.lua                  Language servers and LspAttach mappings
    treesitter.lua           Parsers, highlighting, and text objects
    ui.lua                   Status line, notifications, colors, icons, themes
    writing.lua              Markdown and LaTeX
docs/
  neovim-cheatsheet.md        Detailed reference for GitHub and Obsidian
examples/                    Sample files for manual checks
```

Loading order: leader keys → editor options → Lazy/plugins → global mappings. Add plugins to the appropriate file in `lua/specs/`; Lazy imports all specifications in that directory.

## Maintenance

| Command | Purpose |
|---|---|
| `:Lazy` | Inspect installed plugins and their status |
| `:Lazy check` | Check for updates |
| `:Lazy update` | Update plugins and the lockfile |
| `:Lazy restore` | Restore plugins to the versions in the current lockfile |
| `:TSUpdate` | Update installed parsers |
| `:messages` | Show errors and other messages |
| `:verbose nmap <Space>e` | Show where a mapping was defined |

Commit `lazy-lock.json` alongside the configuration. To return to older plugin versions, restore the corresponding older lockfile first, then run `:Lazy restore`. Restart Neovim after major updates. Automatic update checking is disabled.

Treesitter and textobjects use `main` and their new APIs. Harpoon intentionally uses `master` and its older API. Lazy is the only plugin manager; when migrating an older installation, remove active Packer loaders and packages from the runtime paths.

## Local data and limitations

- Plugins and parsers live under Neovim's data directory (`:lua print(vim.fn.stdpath("data"))`), normally `~/.local/share/nvim` on macOS/Linux. They do not come with a clone of this repository.
- Undo history is stored in the data directory's `undo/` folder, which is created as needed.
- If the data directory contains `tools/bin`, it is added to `PATH` **for the Neovim process only**. The verified machine had tree-sitter CLI 0.27.1 there; new installations must install the CLI separately.
- LuaSnip handles LSP snippets, but no separate collection of predefined snippets is included.
- Formatting is manual through LSP. No general-purpose formatter, format-on-save behavior, debugger, or test integration is configured.
- Markdown support does not include Obsidian-specific wikilink or backlink features.
- `examples/` contains samples, not an automated test suite. The Python sample has its own data-processing dependencies and external input files; it is not an installation script. Its Swedish language model identifier is intentional sample functionality.
- Verification covered startup, parsing six sample files, file navigation, and a clangd connection. Not every language server or visual PDF/browser preview has been verified.
