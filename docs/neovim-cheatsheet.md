
# Neovim keyboard cheat sheet


> [!tip] Start here
> Press **Space and wait** for Which-key. `Space fk` searches mappings, `Space ?` shows local mappings, and `fh` searches help.

## Key notation

- `Space` is `<leader>`: press Space, then the letters in sequence.
- `\` is `<localleader>`, used by VimTeX.
- `Ctrl` means `<C-…>`, `Alt` means `<A-…>`, and `Shift` means `<S-…>`.
- **N** = normal, **I** = insert, **V** = visual, **O** = operator-pending, after `d`, `c`, or `y`.
- Unless stated otherwise, mappings apply in normal mode. Buffer-local mappings may override global mappings.
- On macOS, Option may need to be configured as Alt/Meta. macOS may intercept Ctrl+Space to switch input sources.

## Everyday editing

| Keys | Action | Mode |
|---|---|---|
| `ii` | Leave insert mode; typing two i characters quickly also triggers this | I |
| `Esc` | Clear search highlighting | N |
| `Space rp` | Prepare whole-file replacement of the word under the cursor; enter replacement text, then Enter to execute | N |
| `Space p` | Paste the latest **yank** from register 0, not the system clipboard | N |
| `Tab` / `Shift+Tab` | Next / previous buffer | N |
| `:w` / `:q` / `:wq` | Save / close window / save and close | Command |
| `u` / `Ctrl+r` | Undo / redo | N |
| `yy` / `p` | Yank line / paste after cursor | N |
| `gcc` / `gc` | Comment line / selection using Neovim's built-in commenting | N / V |
| `Ctrl+o` / `Ctrl+i` | Back / forward in the jump list | N |

`clipboard=unnamedplus` connects normal clipboard operations to the system clipboard. `Space p` explicitly uses register 0. Some terminals encode Tab and Ctrl+i identically, so the buffer mapping may affect forward jumps; inspect history with `:jumps`.

## Windows

| Keys | Action |
|---|---|
| `ss` | Split horizontally and switch to the next window |
| `sv` | Split vertically and switch to the next window |
| `Ctrl+h/j/k/l` | Move left / down / up / right |
| `Alt+↑` / `Alt+↓` | Increase / decrease height |
| `Alt+→` / `Alt+←` | Increase / decrease width |
| `Ctrl+w =` | Equalize window sizes |
| `Ctrl+w q` | Close current window |
| `Ctrl+w o` | Keep only the current window |

`ss` and `sv` replace normal mode's usual `s` behavior. In NvimTree, Ctrl+k opens an information popup; use Ctrl+w k to move upward there.

## Search — Telescope

| Keys | Action |
|---|---|
| `ff` | Find files |
| `fg` | Search project text using ripgrep |
| `fb` | List open buffers |
| `fh` | Search help tags |
| `fv` | Enter a string to search for in the project |
| `Space fk` | Search keyboard mappings |
| `Space fe` | Open Telescope File Browser |
| `Space ft` | Select a color scheme for this session |

Search starts in Neovim's working directory (`:pwd`; change it with `:cd path`). The `f`-prefixed mappings cause the built-in `f` command to wait briefly for another key.

Inside a Telescope picker:

| Keys | Action |
|---|---|
| `Ctrl+n/p` or `↓/↑` | Next / previous result in insert mode |
| `Enter` | Open selection |
| `Ctrl+x` / `Ctrl+v` / `Ctrl+t` | Open in horizontal split / vertical split / tab |
| `Tab` / `Shift+Tab` | Toggle selection and move forward / backward |
| `Ctrl+u/d` | Scroll preview up / down |
| `Esc` | Leave insert mode; press again in normal mode to close |
| `Ctrl+c` | Close picker |
| `Ctrl+/` in I, `?` in N | Show picker mappings |

In File Browser, press `Esc` for normal mode: `c` creates, `r` renames, `m` moves, `y` copies, `d` deletes, `g` opens the parent directory, and `h` toggles hidden files. Check the selection before moving or deleting. Local help shows all actions.

## File tree — NvimTree

`Space e` toggles the tree. These mappings apply **inside the tree**.

| Keys | Action |
|---|---|
| `Enter` / `o` | Open file or expand directory |
| `Ctrl+v/x/t` | Open in vertical split / horizontal split / tab |
| `Tab` | Preview file |
| `Backspace` | Close directory and move to its parent |
| `-` | Move tree root up one directory |
| `Ctrl+]` | Make selected directory the root |
| `a` | Create file; end the name with `/` to create a directory |
| `r` / `e` | Rename / rename basename |
| `x` / `c` / `p` | Cut / copy / paste |
| `d` / `D` | Delete / move to trash if a trash utility is available |
| `y` / `Y` / `gy` | Copy name / relative path / absolute path |
| `H` / `I` | Toggle hidden files / Git-ignored files |
| `f` / `F` | Filter / clear filter |
| `R` | Refresh tree |
| `E` / `W` | Expand all / collapse all |
| `Ctrl+k` | Show file information |
| `g?` | Show all local shortcuts |
| `q` | Close tree |

## Quick files — Harpoon

Harpoon intentionally uses `master` and its existing API.

| Keys | Action |
|---|---|
| `Space ha` | Add current file |
| `Space hm` | Open menu |
| `Space h1` … `Space h4` | Jump directly to file 1 … 4 |
| `Enter` in the menu | Open selected file |
| `Ctrl+v` / `Ctrl+x` in the menu | Open in vertical / horizontal split |

Edit menu lines to remove or reorder bookmarks. `dd` removes a line. The plugin persists menu edits when you leave it.

## Completion and snippets

| Keys | Action | Mode |
|---|---|---|
| `Ctrl+Space` | Open completion menu | I |
| `Ctrl+n/p` | Next / previous suggestion | I |
| `Enter` | Confirm the **selected** suggestion; nothing is selected automatically | I |
| `Ctrl+e` | Abort completion | I |
| `Ctrl+d/f` | Scroll documentation up / down | I |
| `Tab` | Next suggestion; otherwise expand snippet / jump to next field; otherwise normal Tab | I, select |
| `Shift+Tab` | Previous suggestion or snippet field | I, select |

Sources: language server, LuaSnip, paths, and buffer words. Completion is also configured for `/`, `?`, and `:` with cmp's command-line mappings. LuaSnip handles LSP snippets; no additional snippet collection is installed. Autopairs inserts matching brackets and quotes and integrates with cmp.

## Code navigation and diagnostics — LSP

> [!important] Requires an attached language server
> Code mappings are installed when a server attaches to the buffer. Run `:checkhealth vim.lsp` for status. Install the servers you need as described in the README. Finding an executable does not guarantee that a particular project can be analyzed.

| Keys | Action |
|---|---|
| `gd` / `gD` | Go to definition / declaration |
| `gr` / `gi` | Find references / go to implementation |
| `K` | Show symbol documentation |
| `Space rn` | Rename symbol through the language server |
| `Space ca` | Code action; also available in visual mode |
| `Space cf` | Format buffer through an attached server with formatting support |
| `Space cs` | Show signature help |
| `]d` / `[d` | Next / previous diagnostic |
| `Space cd` | Show diagnostic details under cursor |
| `Space cq` | Populate the location list with buffer diagnostics |

Diagnostic mappings are global. Neovim also supplies LSP defaults; see `:help lsp-defaults`. This configuration maps `gr` as a complete command, which may be delayed by Neovim's longer `gr…` mappings.

## Syntax-aware selections — Treesitter

Requires a parser and queries for the language. Use in visual mode or after an operator: `vaf`, `dif`, `yaf`.

| Object / keys | Scope or action |
|---|---|
| `af` / `if` | Whole function / function contents |
| `ac` / `ic` | Whole class / class contents |
| `aa` / `ia` | Parameter with surrounding text / parameter contents |
| `]m` / `[m` | Next / previous function start |
| `]M` / `[M` | Next / previous function end |

Language plugins can define local alternatives: in TeX, `ac`/`ic` can refer to commands, and filetype plugins may supply their own motions. Use `:verbose nmap ]m` to inspect the active mapping.

The README lists 20 parser packages used during verification: Lua, Vim, Vimdoc, Query, Python, JavaScript, TypeScript, TSX, HTML, CSS, JSON, Markdown, Markdown inline, Java, Bash, C, C++, Rust, YAML, and TOML. A fresh clone requires installing these separately. Add parsers with `:TSInstall language`; update with `:TSUpdate`.

## Git — Gitsigns

| Keys | Action |
|---|---|
| `Space g` | Toggle Git signs |
| `]h` / `[h` | Next / previous hunk |
| `Space hp` | Preview hunk |
| `Space hb` | Show blame for current line |
| `Space hd` | Diff against the index |
| `Space hs` | Stage current hunk |
| `Space hr` | **Reset current hunk — discards its changes** |

Applies to files Gitsigns can track in a Git repository. Markdown maps `]h` locally to the current heading; use `:Gitsigns next_hunk` there. `:Gitsigns` followed by Tab lists more actions. Commit and push have no custom mappings.

## Undo history — Undotree

`Space u` toggles the tree. Use `Ctrl+w` motions to focus it. `?` shows local help, `j/k` navigate, and `Enter` selects a history state. `u` and `Ctrl+r` work in the text buffer. History persists between sessions in Neovim's data directory under `undo/`.

## Markdown

| Keys / command | Action |
|---|---|
| `Space mp` | Start / stop browser preview for Markdown |
| `]]` / `[[` | Next / previous heading |
| `][` / `[]` | Next / previous sibling heading |
| `]h` / `]u` | Current / parent heading |
| `gx` | Open link externally |
| `ge` | Open linked file in Neovim |
| `:Toc` | Show table of contents |
| `:HeaderIncrease` / `:HeaderDecrease` | Increase / decrease heading levels; accepts a line range |

Automatic vim-markdown folding is disabled. `:TableFormat` requires Tabular, which is not installed. Obsidian-specific wikilinks, backlinks, and daily note workflows are not included.

## LaTeX — VimTeX

Applies in TeX buffers. The prefix is **backslash**, not Space. Compilation requires a TeX distribution and latexmk; PDF viewing requires a working viewer.

| Keys | Action |
|---|---|
| `\ll` | Start compilation using VimTeX settings |
| `\lk` / `\lK` | Stop compilation / all compilations |
| `\lv` | Open PDF viewer |
| `\le` | Show compilation errors |
| `\lt` / `\lT` | Open / toggle table of contents |
| `\li` / `\lI` | Information / full information |
| `\lq` / `\lo` | Log / compilation output |
| `\lg` / `\lG` | Status / all statuses |
| `\lc` / `\lC` | Clean auxiliary files / full clean; check the project's generated files |
| `\ls` | Toggle main document |
| `\lm` | List insert mappings, including math shortcuts |
| `\la` | Context menu |
| `\lp` | Toggle preview |
| `cse` / `dse` | Change / delete surrounding environment |
| `csc` / `dsc` | Change / delete surrounding command |
| `F6` / `F7` | Surround with environment / create command |

Complete reference: `:help vimtex-default-mappings`. Some function keys require Fn on macOS.

## Plugins without custom global shortcuts

| Plugin | Usage |
|---|---|
| lualine | Automatically displays mode, file, and Git status |
| indent-blankline (`ibl`) | Automatically displays indentation guides |
| nvim-web-devicons | Provides icons to other plugins; use a Nerd Font if glyphs are missing |
| nvim-notify | Displays notifications; `:Notifications` shows history |
| Colorizer | Highlights color values; toggle with `:ColorizerToggle` |
| nvim-autopairs | Automatically pairs brackets and quotes |
| plenary | Shared library; no user mappings |
| cmp-* and cmp_luasnip | Completion menu sources |
| nvim-lspconfig | Server definitions; server executables are installed separately |
| Themes | `Space ft` or `:colorscheme name`; Seashell loads if its local directory exists |
| lazy.nvim | `:Lazy` for status, updates, restoration, and profiling |

Theme packages: Nightfox, Gruvbox, Nightfly, Tokyo Night, Catppuccin, Kanagawa, Dracula, OneDark, Apprentice, Solarized, and local Seashell. Some packages provide multiple schemes; `Space ft` lists valid names.

## Maintenance and troubleshooting

1. `:Lazy check` checks for updates; `:Lazy update` installs them and updates the lockfile.
2. `:TSUpdate` updates parsers after Treesitter updates.
3. `:checkhealth` reports dependencies and problems. Prioritize features you use.
4. `:messages` shows messages; `:verbose nmap <Space>e` shows a mapping's origin.
5. `:Lazy restore` restores the **current** lockfile. Restore an older lockfile first to recover older versions.
6. Restart Neovim after major plugin updates.

## Quick workflows

- **Find and edit:** `fg` → search text → Enter → `gd` → edit → `:w`.
- **Four important files:** `Space ha` in each file → jump with `Space h1` … `Space h4`.
- **Review changes:** `]h` → `Space hp` → `Space hs` to stage the hunk.
- **Write Markdown:** `Space mp` → write → `:w` → `]]` for the next heading.
- **Learn more:** `Space fk` → search a plugin or action → `fh` for documentation.
