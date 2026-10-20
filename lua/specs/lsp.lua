return {
    { "neovim/nvim-lspconfig", dependencies = { "hrsh7th/cmp-nvim-lsp" }, config = function()
        vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
        vim.lsp.config("lua_ls", { settings = { Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = { vim.env.VIMRUNTIME }, checkThirdParty = false },
        } } })
        -- Enable only installed servers. Install language tools separately as needed.
        local servers = { lua_ls = "lua-language-server", pyright = "pyright-langserver",
            ts_ls = "typescript-language-server", clangd = "clangd", rust_analyzer = "rust-analyzer",
            texlab = "texlab", html = "vscode-html-language-server", cssls = "vscode-css-language-server",
            jsonls = "vscode-json-language-server", bashls = "bash-language-server", jdtls = "jdtls" }
        for server, executable in pairs(servers) do
            if vim.fn.executable(executable) == 1 then vim.lsp.enable(server) end
        end
        vim.diagnostic.config({ severity_sort = true, underline = true, virtual_text = false })
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspMaps", { clear = true }),
            callback = function(event)
                local function map(key, fn, desc, mode)
                    vim.keymap.set(mode or "n", key, fn, { buffer = event.buf, desc = desc })
                end
                map("gd", vim.lsp.buf.definition, "Go to definition")
                map("gD", vim.lsp.buf.declaration, "Go to declaration")
                map("gr", vim.lsp.buf.references, "Find references")
                map("gi", vim.lsp.buf.implementation, "Go to implementation")
                map("K", vim.lsp.buf.hover, "Hover documentation")
                map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })
                map("<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")
                map("<leader>cs", vim.lsp.buf.signature_help, "Signature help")
            end,
        })
    end },
}
