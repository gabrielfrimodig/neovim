-- init.lua

require('settings');
require('plugins');
require('theme');
require('maps');

require('plugins/lualine');
require('plugins/lsp_config');
require('gitsigns').setup()
require('ibl').setup()
require('plugins/cmp_config');
require('nvim-tree').setup()
