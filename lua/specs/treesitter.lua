return {
    { "nvim-treesitter/nvim-treesitter", branch = "main", lazy = false, build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({})
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
                callback = function(event)
                    local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
                    local ok, loaded = pcall(vim.treesitter.language.add, lang or "")
                    if ok and loaded then
                        vim.treesitter.start(event.buf, lang)
                    end
                end,
            })
        end },
    { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main", lazy = false,
        opts = { select = { lookahead = true }, move = { set_jumps = true } },
        config = function(_, opts)
            require("nvim-treesitter-textobjects").setup(opts)
            for key, capture in pairs({ af = "@function.outer", ["if"] = "@function.inner", ac = "@class.outer", ic = "@class.inner", aa = "@parameter.outer", ia = "@parameter.inner" }) do
                vim.keymap.set({ "x", "o" }, key, function()
                    require("nvim-treesitter-textobjects.select").select_textobject(capture, "textobjects")
                end, { desc = "Select " .. capture })
            end
            for key, method in pairs({ ["]m"] = "goto_next_start", ["[m"] = "goto_previous_start", ["]M"] = "goto_next_end", ["[M"] = "goto_previous_end" }) do
                vim.keymap.set({ "n", "x", "o" }, key, function()
                    require("nvim-treesitter-textobjects.move")[method]("@function.outer", "textobjects")
                end, { desc = method .. " function" })
            end
        end },
}
