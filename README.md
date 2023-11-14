# Neovim Configuration

<div align="center">
    <img width="760px" src="https://i.imgur.com/71UH5Y9.png" />
</div>

This repository contains my personal [Neovim](https://github.com/neovim/neovim) configuration.

## Plugins

- [Packer](https://github.com/wbthomason/packer.nvim): A package manager for Neovim.

### LSP and Autocompletion

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Essential configurations for the built-in Neovim LSP.
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): Main autocompletion engine for Neovim.
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): LSP source for nvim-cmp.
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer), [cmp-path](https://github.com/hrsh7th/cmp-path), [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline): Autocompletion for buffer, path, and command line.
- [cmp-path](https://github.com/hrsh7th/cmp-path): Path completions for nvim-cmp.
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline): Command line completions for nvim-cmp.

### Snippets

- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip): Snippet completions for nvim-cmp.
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip): A Lua-based snippet engine.

### Syntax Highlighting

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Advanced syntax highlighting.

### File Browsing and Searching

- [Telescope](https://github.com/nvim-telescope/telescope.nvim): A highly extendable fuzzy finder over lists.
- [Telescope File Browser](https://github.com/nvim-telescope/telescope-file-browser.nvim): File browsing extension for Telescope.
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua): A file explorer for Neovim.

### Mason

- [mason.nvim](https://github.com/williamboman/mason.nvim): Package manager for external tooling.
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim): Integrates Mason with nvim-lspconfig.

### Markdown and LaTeX
- [vim-markdown](https://github.com/preservim/vim-markdown): Markdown syntax highlighting and matching rules.
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim): Markdown preview in the browser.
- [vimtex](https://github.com/lervag/vimtex): A modern Vim and Neovim filetype plugin for LaTeX files.

### Utilities

- [Harpoon](https://github.com/ThePrimeagen/harpoon): Quick file navigation and workspace management.
- [Lualine](https://github.com/nvim-lualine/lualine.nvim): A fast and customizable status line.
- [undotree](https://github.com/mbbill/undotree): Visualize your undo history.
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim): Git integration for buffers.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs): Automatic insertion of pairs (brackets, quotes).
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim): Adds indentation guides to all lines.
- [Nightfox](https://github.com/EdenEast/nightfox.nvim): A stylish and easy-on-the-eyes color scheme.
- [nvim-notify](https://github.com/rcarriga/nvim-notify): A fancy, configurable notification manager for Neovim.
- [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua): A plugin for color highlighting.
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Developer icons for Neovim.
- [vim-devicons](https://github.com/ryanoasis/vim-devicons): Icon support for various Neovim plugins.

### Theme

- [Nightfox](https://github.com/EdenEast/nightfox.nvim): A stylish and easy-on-the-eyes color scheme.

## Key Mappings

Key mappings are set up for efficiency and ease of navigation, editing, and management of the Neovim environment. Here are some highlights:

- `ii`: Exit insert mode.
- `<Space>`: Clear search highlights.
- `Ctrl+h/j/k/l`: Navigate between splits.
- `Alt+Arrow Keys`: Resize splits.
- `<leader>rp`: Replace the word under the cursor throughout the file.
- `<leader>p`: Paste the last yanked content.
- `<leader>e`: Toggle Nvim Tree.
- `<leader>u`: Toggle UndoTree.
- `ff/fg/fb/fh/fv`: Various Telescope commands for finding files, live grep, etc.
- `<leader>g`: Toggle Gitsigns.

## Installation

`Neovim >= 0.5`

```bash
git clone https://github.com/gabrielfrimodig/neovim.git ~/.config/nvim
```

## Contributions

Feel free to fork, submit issues, or pull requests to enhance this configuration!
