return {
    { "hrsh7th/nvim-cmp", dependencies = {
        "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip", "L3MON4D3/LuaSnip",
    }, config = function()
        local cmp, snip = require("cmp"), require("luasnip")
        cmp.setup({
            snippet = { expand = function(args) snip.lsp_expand(args.body) end },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then cmp.select_next_item()
                    elseif snip.expand_or_jumpable() then snip.expand_or_jump()
                    else fallback() end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then cmp.select_prev_item()
                    elseif snip.jumpable(-1) then snip.jump(-1)
                    else fallback() end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" }, { name = "path" } }, { { name = "buffer" } }),
        })
        cmp.setup.cmdline({ "/", "?" }, { mapping = cmp.mapping.preset.cmdline(), sources = { { name = "buffer" } } })
        cmp.setup.cmdline(":", { mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }) })
    end },
}
