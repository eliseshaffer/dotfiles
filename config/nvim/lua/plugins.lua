-- -------------------------------------------------------------------------------------------
--
-- Plugins
--
-- -------------------------------------------------------------------------------------------
vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

-- vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').init({max_jobs = 10})

return require('packer').startup(function(use)
  -- manage Packer itself
  use { 'wbthomason/packer.nvim' }

  -- File Management
  use { 'kyazdani42/nvim-tree.lua', config = require('plugins.nvimtree') }
  use { 'nvim-lua/plenary.nvim' } -- Required for telescope
  use { 'nvim-telescope/telescope.nvim', config = require('plugins.telescope') }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind-nvim', config = require('plugins.lspkind') }
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
  -- use { 'romgrk/barbar.nvim', config = require('plugins.barbar') }
  use { 'feline-nvim/feline.nvim', config = require('plugins.feline') }

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'ryanoasis/vim-devicons' }

  -- Colors
  use { 'eliseshaffer/vim-one' }

  -- Tools
  use { 'vim-test/vim-test', config = require('plugins.vim-test') }
  use { "Pocco81/AutoSave.nvim", config = require('plugins.autosave') }
  use { 'fedepujol/move.nvim' }
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = require("plugins.gitsigns") }
  use { 'terrortylor/nvim-comment', config = require("plugins.nvim-comment") }

  -- Start Screen
  use { 'goolord/alpha-nvim', config = require('plugins.alpha') }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
