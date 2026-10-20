-- Core options only: plugin setup lives in lua/specs/.
local opt = vim.opt
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.cursorline = false
opt.wrap = false
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 10
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.fn.mkdir(vim.o.undodir, "p")
opt.undolevels = 10000
opt.undoreload = 10000
opt.shada = "'1000,<50,s10,h"
opt.errorbells = false
opt.cmdheight = 1
opt.laststatus = 3
opt.showtabline = 2
opt.conceallevel = 0
opt.foldcolumn = "0"
opt.foldnestmax = 20
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.backspace = { "indent", "eol", "start" }
opt.splitright = true
opt.scrolloff = 8
opt.timeoutlen = 400
opt.updatetime = 100
opt.lazyredraw = false

-- Optional private tool installation; no global PATH or Homebrew changes.
local tools = vim.fn.stdpath("data") .. "/tools/bin"
if vim.fn.isdirectory(tools) == 1 then
    vim.env.PATH = tools .. ":" .. vim.env.PATH
end
