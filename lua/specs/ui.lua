return {
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = { options = { theme = "auto" } } },
    { "rcarriga/nvim-notify", config = function() vim.notify = require("notify") end },
    { "catgoose/nvim-colorizer.lua", opts = {} },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    "EdenEast/nightfox.nvim", "morhetz/gruvbox", "bluz71/vim-nightfly-colors",
    "folke/tokyonight.nvim", { "catppuccin/nvim", name = "catppuccin" },
    "rebelot/kanagawa.nvim", "Mofiqul/dracula.nvim", "joshdick/onedark.vim",
    "romainl/Apprentice", "shaunsingh/solarized.nvim",
    { dir = vim.fn.expand("~/dev/seashell.nvim"), name = "seashell", priority = 1000,
        cond = function() return vim.fn.isdirectory(vim.fn.expand("~/dev/seashell.nvim")) == 1 end,
        config = function() require("seashell").load() end },
}
