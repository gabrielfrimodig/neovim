-- init.lua

require('settings');
require('plugins');
require('theme');
require('maps');

require('plugins/lualine');
require('plugins/lsp_config');
require('gitsigns').setup()
require('ibl').setup()
require('nvim-tree').setup()
require('colorizer').setup()
require('plugins/cmp_config');
require('mason').setup()
require('plugins/mason_lspconfig')
require("notify").setup({
  background_colour = "#000000",
})
