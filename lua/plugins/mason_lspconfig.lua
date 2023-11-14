-- lua/plugins/mason_lspconfig.lua

local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

-- Ensure the desired LSP servers are installed
mason_lspconfig.setup({
    ensure_installed = {
        'pyright',       -- Python language server
        'tsserver',      -- TypeScript language server
    },
})

-- Basic configuration for each LSP server
mason_lspconfig.setup_handlers({
    -- Default handler (applies to all servers)
    function (server_name)
        lspconfig[server_name].setup {}
    end,
})

