-- lua/maps.lua

-- leader key
vim.g.mapleader = ' '

-- ii to exit insert mode
vim.keymap.set("i", "ii", "<Esc>", {silent = true})

-- Space to remove highlights
vim.keymap.set("n", "<Space>", ":noh<CR>", {silent = true})

vim.keymap.set("n", "<C-h>", "<C-w>h", {silent = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", {silent = true})
vim.keymap.set("n", "<C-k>", "<C-w>k", {silent = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {silent = true})

vim.api.nvim_set_keymap('n', '<A-Up>', ':resize +2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-Down>', ':resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-Right>', ':vertical resize +2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-Left>', ':vertical resize -2<CR>', {noremap = true, silent = true})

-- replace
vim.api.nvim_set_keymap('n', '<leader>rp', ':%s/\\<<C-r><C-w>\\>//g<Left><Left>', { noremap = true, silent = false })

-- paste
vim.api.nvim_set_keymap('n', '<leader>p', "<cmd>lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('\"0p', true, false, true), 'n', false)<CR>", { noremap = true, silent = true })

-- Buffer Navigation
vim.keymap.set('n', '<TAB>', ':bnext<CR>', {silent = true})
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', {silent = true})

-- Nvim Tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {silent = true})

-- Open the UndoTree
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', {silent = true})

-- Add the current file to Harpoon
vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, {silent = true})

-- Open the Harpoon menu
vim.keymap.set('n', '<leader>hm', require('harpoon.ui').toggle_quick_menu, {silent = true})

-- Navigate through Harpoon marks
vim.keymap.set('n', '<leader>h1', function() require('harpoon.ui').nav_file(1) end, {silent = true})
vim.keymap.set('n', '<leader>h2', function() require('harpoon.ui').nav_file(2) end, {silent = true})
vim.keymap.set('n', '<leader>h3', function() require('harpoon.ui').nav_file(3) end, {silent = true})
vim.keymap.set('n', '<leader>h4', function() require('harpoon.ui').nav_file(4) end, {silent = true})

-- cmp
vim.api.nvim_set_keymap('i', '<C-e>', "cmp.mapping.close()<CR>", {expr = true, noremap = true})

-- gitsigns 
vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('gitsigns').toggle_signs()<CR>", { noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', 'fv', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

