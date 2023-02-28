-- -------------------------------------------------------------------------------------------
--
-- Plugins
--
-- -------------------------------------------------------------------------------------------
--vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

-- vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').init({max_jobs = 10})

require('packer').startup(function(use)
  -- manage Packer itself
  use { 'wbthomason/packer.nvim' }

  -- File Management
  use { 'kyazdani42/nvim-tree.lua', config = function() require 'plugins.nvimtree' end  }
  use { 'nvim-lua/plenary.nvim' } -- Required for telescope
  use { 'nvim-telescope/telescope.nvim', config = function() require 'plugins.telescope' end }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  -- use { 'onsails/uspkind-nvim'  }
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
  use { 'alexaandru/nvim-lspupdate' }

  -- Autocomplete / Snippets
  use { 'hrsh7th/nvim-cmp', config = function() require 'plugins.nvim-cmp' end }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'windwp/nvim-autopairs' }
  require('nvim-autopairs').setup()

  -- Treesitter / Formatting
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require 'plugins.treesitter' end
  }
  use { 'p00f/nvim-ts-rainbow' }
  use { 'sheerun/vim-polyglot' }
  use { 'jlcrochet/vim-rbs' }
  use { 'preservim/vim-pencil' }
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  }
  require("nvim-gps").setup()

  -- UI
  -- use { 'romgrk/barbar.nvim' require('plugins.barbar') }
  -- use { 'feline-nvim/feline.nvim', tag = 'v0.4.0' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require 'plugins.lualine' end 
  }
  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'ryanoasis/vim-devicons' }

  -- Colors
  use { 'eliseshaffer/vim-one' }
  use { 'marko-cerovac/material.nvim', config = function() require 'plugins.material' end }

  -- Tools
  use { 'vim-test/vim-test', config = function() require 'plugins.vim-test' end }
  use { "pocco81/auto-save.nvim" }
  use { 'ur4ltz/move.nvim' }
  use { 'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require 'plugins.gitsigns' end
  }
  use { 'TimUntersberger/neogit',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require 'plugins.neogit' end
  }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'preservim/nerdcommenter' }
  use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}
  use { 'mattn/emmet-vim' }
  use { 'knsh14/vim-github-link' }
  use { 'fgheng/winbar.nvim', config = function() require 'plugins.winbar' end }
  -- use { "akinsho/toggleterm.nvim" } -- Opens a terminal
  -- use { 'ptzz/lf.vim' }
  -- use { 'voldikss/vim-floaterm' }
  -- Start Screen
  use { 'goolord/alpha-nvim', 
    config = function() 
      require 'plugins.alpha'
    end
  }
  -- use { 'rmagatti/auto-session' }
  -- use { 'rmagatti/session-lens', requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'} }
  use { 'blaineventurine/sessionable',
    config = function()  
      require("sessionable").setup({
          session_dir = "$HOME/.local/share/nvim/session/",
          log_level = "debug"
        })
    end 
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- -------------------------------------------------------------------------------------------
--
-- Plugin Configs
--
-- -------------------------------------------------------------------------------------------
-- require('plugins.nvimtree')
-- require('plugins.telescope')
--require('plugins.lspkind')
-- require('plugins.feline')
-- require('plugins.lualine')
-- require('plugins.material')
-- require('plugins.vim-test')
-- require('plugins.autosave')
-- require("plugins.gitsigns")
-- require("plugins.neogit")
-- require("plugins.nvim-cmp")
-- require("plugins.toggleterm")
-- require("plugins.treesitter")
-- require("plugins.winbar")

vim.g.NERDSpaceDelims = 1
require'luasnip'.filetype_extend("ruby", {"rails"})

