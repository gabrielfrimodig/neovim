-- ~/.config/nvim/lua/keymaps.lua

-- Exit insert mode with `ii`
vim.keymap.set("i", "ii", "<Esc>", { silent = true, desc = "Exit Insert Mode" })

-- Split window
vim.keymap.set("n", "ss", ":split<CR><C-w>w", { noremap = true, silent = true, desc = "Split Window Horizontally" })
vim.keymap.set("n", "sv", ":vsplit<CR><C-w>w", { noremap = true, silent = true, desc = "Split Window Vertically" })

-- Clear search without conflicting with the leader key
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true, desc = "Remove Search Highlights" })

-- Movement between splits
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Move Left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Move Down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Move Up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Move Right" })

-- Resize splits
vim.keymap.set("n", "<A-Up>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Increase Height" })
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Decrease Height" })
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true, desc = "Increase Width" })
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true, desc = "Decrease Width" })

-- Replace all instances of a word
vim.keymap.set("n", "<leader>rp", ':%s/\\<<C-r><C-w>\\>//g<Left><Left>',
    { noremap = true, silent = false, desc = "Replace Word Under Cursor" })

-- Paste from yank register 0
vim.keymap.set("n", "<leader>p", "\"0p", { noremap = true, silent = true, desc = "Paste Last Yank" })

-- Buffer navigation
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { silent = true, desc = "Next Buffer" })
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", { silent = true, desc = "Previous Buffer" })

-- Nvim Tree toggle
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle NvimTree" })

-- UndoTree toggle
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { silent = true, desc = "Toggle UndoTree" })

-- Harpoon marks
vim.keymap.set("n", "<leader>ha", function() require("harpoon.mark").add_file() end,
    { silent = true, desc = "Add File to Harpoon" })
vim.keymap.set("n", "<leader>hm", function() require("harpoon.ui").toggle_quick_menu() end,
    { silent = true, desc = "Toggle Harpoon Menu" })
vim.keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end,
    { silent = true, desc = "Navigate to Harpoon Mark 1" })
vim.keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end,
    { silent = true, desc = "Navigate to Harpoon Mark 2" })
vim.keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end,
    { silent = true, desc = "Navigate to Harpoon Mark 3" })
vim.keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end,
    { silent = true, desc = "Navigate to Harpoon Mark 4" })

-- Gitsigns toggle signs
vim.keymap.set("n", "<leader>g", function() require("gitsigns").toggle_signs() end,
    { noremap = true, silent = true, desc = "Toggle Git Signs" })

-- Telescope keybindings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "fb", builtin.buffers, { desc = "List Buffers" })
vim.keymap.set("n", "fh", builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "fv", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep String" })

-- Discover commands and use previously unconfigured plugins.
vim.keymap.set("n", "<leader>?", function() require("which-key").show({ global = false }) end, { desc = "Show buffer keymaps" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Search all keymaps" })
vim.keymap.set("n", "<leader>fe", function() require("telescope").extensions.file_browser.file_browser() end, { desc = "File browser" })
vim.keymap.set("n", "<leader>ft", builtin.colorscheme, { desc = "Choose theme" })
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown preview" })
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Diagnostic details" })
vim.keymap.set("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Buffer diagnostics" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]h", function() require("gitsigns").nav_hunk("next") end, { desc = "Next Git hunk" })
vim.keymap.set("n", "[h", function() require("gitsigns").nav_hunk("prev") end, { desc = "Previous Git hunk" })
for key, action in pairs({ hs = "stage_hunk", hr = "reset_hunk", hp = "preview_hunk", hb = "blame_line", hd = "diffthis" }) do
    vim.keymap.set("n", "<leader>" .. key, function() require("gitsigns")[action]() end, { desc = "Git " .. action })
end
