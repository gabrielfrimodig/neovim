return {
    { "nvim-telescope/telescope.nvim", dependencies = {
        "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim",
    }, config = function()
        require("telescope").setup({})
        require("telescope").load_extension("file_browser")
    end },
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" },
        init = function() vim.g.loaded_netrw = 1; vim.g.loaded_netrwPlugin = 1 end,
        opts = {} },
    { "ThePrimeagen/harpoon", branch = "master", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
    { "mbbill/undotree" },
    { "lewis6991/gitsigns.nvim", opts = {} },
    { "windwp/nvim-autopairs", opts = {}, config = function(_, opts)
        require("nvim-autopairs").setup(opts)
        require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end, dependencies = { "hrsh7th/nvim-cmp" } },
    { "folke/which-key.nvim", opts = {} },
}
