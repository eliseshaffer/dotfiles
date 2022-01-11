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
  use { 'onsails/lspkind-nvim'  }
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
  use { 'alexaandru/nvim-lspupdate' }

  -- Autocomplete / Snippets
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'windwp/nvim-autopairs' }
  require('nvim-autopairs').setup()

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'p00f/nvim-ts-rainbow' }

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
  use { 'terrortylor/nvim-comment'  }
  use { 'npxbr/glow.nvim' } -- Markdown Previewer

  -- Start Screen
  use { 'goolord/alpha-nvim'  }
  use { 'rmagatti/auto-session' }
  use { 'rmagatti/session-lens', requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'} }

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
require('plugins.lspkind')
require('plugins.feline')
require('plugins.vim-test')
require('plugins.autosave')
require("plugins.gitsigns")
require("plugins.nvim-comment")
require('plugins.alpha')

require('auto-session').setup {
  log_level = 'info',
  -- auto_session_enabled = false,
  auto_session_suppress_dirs = {'~/', '~/Projects'},
  auto_restore_enabled = false,
}

require('session-lens').setup({
  path_display = {'shorten'},
  previewer = false,
  prompt_position = "bottom",
  layout_strategy = "bottom_pane"
})

