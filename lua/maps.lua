
-- Insert mode
-- ii to exit insert mode
vim.keymap.set("i", "ii", "<Esc>", {silent = true})

-- Normal mode
vim.keymap.set("n", "<C-h>", "<C-w>h", {silent = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", {silent = true})
vim.keymap.set("n", "<C-k>", "<C-w>k", {silent = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {silent = true})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
