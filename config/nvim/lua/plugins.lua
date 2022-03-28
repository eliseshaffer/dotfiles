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
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'nvim-lua/plenary.nvim' } -- Required for telescope
  use { 'nvim-telescope/telescope.nvim'  }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  -- use { 'onsails/uspkind-nvim'  }
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
  use { 'alexaandru/nvim-lspupdate' }

  -- Autocomplete / Snippets
  use { 'hrsh7th/nvim-cmp' }
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'windwp/nvim-autopairs' }
  require('nvim-autopairs').setup()

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'p00f/nvim-ts-rainbow' }
  use { 'sheerun/vim-polyglot' }

  -- UI
  -- use { 'romgrk/barbar.nvim' require('plugins.barbar') }
  use { 'feline-nvim/feline.nvim'  }

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'ryanoasis/vim-devicons' }

  -- Colors
  use { 'eliseshaffer/vim-one' }

  -- Tools
  use { 'vim-test/vim-test'  }
  use { "Pocco81/AutoSave.nvim"  }
  use { 'fedepujol/move.nvim' }
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}  }
  use { 'preservim/nerdcommenter'  }
  use { 'npxbr/glow.nvim' } -- Markdown Previewer
  use { 'mattn/emmet-vim' }
  use { 'knsh14/vim-github-link' }

  -- Start Screen
  use { 'goolord/alpha-nvim'  }
  -- use { 'rmagatti/auto-session' }
  -- use { 'rmagatti/session-lens', requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'} }
  use { 'blaineventurine/sessionable' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- -------------------------------------------------------------------------------------------
--
-- Plugin Configs
--
-- -------------------------------------------------------------------------------------------
require('plugins.nvimtree')
require('plugins.telescope')
--require('plugins.lspkind')
require('plugins.feline')
require('plugins.vim-test')
require('plugins.autosave')
require("plugins.gitsigns")
require('plugins.alpha')
require("plugins.nvim-cmp")
require("sessionable").setup({
  session_dir = "~/.local/share/nvim/session/",
  log_level = "debug"
})

