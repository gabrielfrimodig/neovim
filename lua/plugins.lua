-- lua/plugins.lua

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'   -- Configurations for Nvim LSP
  use 'hrsh7th/nvim-cmp'        -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'    -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'      -- Buffer completions for nvim-cmp
  use 'hrsh7th/cmp-path'        -- Path completions for nvim-cmp
  use 'hrsh7th/cmp-cmdline'     -- Command line completions for nvim-cmp

  -- CMP
  use 'saadparwaiz1/cmp_luasnip'    -- Snippet completions
  use 'L3MON4D3/LuaSnip'            -- Snippet engine

  -- Add Treesitter with additional modules
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
      "nvim-telescope/telescope-file-browser.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
 
  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly'
  }

  -- Mason
  use 'williamboman/mason.nvim'

  -- Mason lspconfig
  use 'williamboman/mason-lspconfig.nvim'

  -- Web Devicons
  use 'nvim-tree/nvim-web-devicons'

  -- harpoon 
  use 'ThePrimeagen/harpoon'

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- undotree  
  use 'mbbill/undotree'

  -- Gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('gitsigns').setup() end
  }

  -- Markdown
  use 'preservim/vim-markdown'

  -- Markdown preview
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Vimtex
  use 'lervag/vimtex'

  -- nvim-autopairs
  use {
  	"windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

  -- Notify
  use 'rcarriga/nvim-notify'

  -- Devicons
  use 'ryanoasis/vim-devicons'

  -- colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- Blankline
  use "lukas-reineke/indent-blankline.nvim"

  -- Nightfox
  use 'EdenEast/nightfox.nvim'

  -- Gruvbox
  use 'morhetz/gruvbox'

  -- Nightfly
  use "bluz71/vim-nightfly-colors"

  -- Tokyonight
  use "folke/tokyonight.nvim"

  -- Catppuccino
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Kanagawa
  use "rebelot/kanagawa.nvim"

  -- Dracula
  use 'Mofiqul/dracula.nvim'

  -- Onedark
  use "joshdick/onedark.vim"

  -- Apprentice
  use "romainl/Apprentice"

  -- Solarized
  use "shaunsingh/solarized.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
