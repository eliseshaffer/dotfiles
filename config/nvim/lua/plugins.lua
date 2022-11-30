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
  use { 'wbthomason/packer.nvim', commit = "4dedd3b08f8c6e3f84afbce0c23b66320cd2a8f2" }

  -- File Management
  use { 'kyazdani42/nvim-tree.lua', commit = "483f1550d1c53f7dcf261d40af5f993ffcb8b9c3"  }
  use { 'nvim-lua/plenary.nvim', commit = "9069d14a120cadb4f6825f76821533f2babcab92" } -- Required for telescope
  use { 'nvim-telescope/telescope.nvim', commit = "c93276acd34f5cb20d7cc2de15a8f40526433660"  }

  -- LSP
  use { 'neovim/nvim-lspconfig', commit = "b6d9e427c9fafca5b84a1f429bef4df3ef63244b" }
  -- use { 'onsails/uspkind-nvim'  }
  use { 'weilbith/nvim-code-action-menu', commit = "", cmd = 'CodeActionMenu' }
  use { 'alexaandru/nvim-lspupdate', commit = "8b809b7887790f1742b6f9de6d35c35f07c23ec2" }

  -- Autocomplete / Snippets
  use { 'hrsh7th/nvim-cmp', commit = "f81bfee10909e39c82ccd230f6f997438b16092e" }
  use { 'L3MON4D3/LuaSnip', commit = "50760912f54dfd0087b29abef6ede39c33615ab9" }
  use { 'saadparwaiz1/cmp_luasnip', commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }
  use { 'hrsh7th/cmp-nvim-lsp', commit = "e6b5feb2e6560b61f31c756fb9231a0d7b10c73d" }
  use { 'rafamadriz/friendly-snippets', commit = "6e0881ad5dfae8bcb160bb6704e1f5fe31be9938" }
  use { 'windwp/nvim-autopairs', commit = "aea913109d30c87df329ec9b8fea9aed6ef9f52a" }
  require('nvim-autopairs').setup()

  -- Treesitter / Formatting
  use { 'nvim-treesitter/nvim-treesitter', commit = "755bfaf2873feb5eea983f8a3a6cae81cf4598c9", run = ':TSUpdate' }
  use { 'p00f/nvim-ts-rainbow', commit = "5fa662e85f736f7ffce0e75b9d98a99f9aca0e4f" }
  use { 'sheerun/vim-polyglot', commit = "38282d58387cff48ac203f6912c05e4c8686141b" }
  use { 'preservim/vim-pencil' }

  -- UI
  -- use { 'romgrk/barbar.nvim' require('plugins.barbar') }
  use { 'feline-nvim/feline.nvim', commit = "79f5e9e5a76842b72f1814dcd4fc239a95ead391"  }

  -- Icons
  use { 'kyazdani42/nvim-web-devicons', commit = "bdd43421437f2ef037e0dafeaaaa62b31d35ef2f" }
  use { 'ryanoasis/vim-devicons', commit = "a2258658661e42dd4cdba4958805dbad1fe29ef4" }

  -- Colors
  use { 'eliseshaffer/vim-one', commit = "d7695ec7521daca6e65ce3f011072ad48666a209" }

  -- Tools
  use { 'vim-test/vim-test', commit = "2240d7a4b868cb594b7d83544e1b6db4df806e5e"  }
  use { "Pocco81/AutoSave.nvim", commit = "3d342d6fcebeede15b6511b13a38a522c6f33bf8"  }
  use { 'fedepujol/move.nvim', commit = "902110c584d214951b8bac52374afc7263d02a6a" }
  use { 'lewis6991/gitsigns.nvim', commit = "ef153188e849bd317c00448755bc4182a2bd495d", requires = {'nvim-lua/plenary.nvim'}  }
  use { 'preservim/nerdcommenter', commit = "f8671f783baeb0739f556d9b6c440ae1767340d6"  }
  use { 'npxbr/glow.nvim', commit = "0c76518e440f2ea4dbadd87beec8eea4ce030f17" } -- Markdown Previewer
  use { 'mattn/emmet-vim', commit = "def5d57a1ae5afb1b96ebe83c4652d1c03640f4d" }
  use { 'knsh14/vim-github-link', commit = "b910c9c2593dbebb38e0ca430025a4b70e01e14b" }
  -- use { "akinsho/toggleterm.nvim", commit = "9f969e7f72d19966756318d61f2562f67dbb1f9c" } -- Opens a terminal
  -- use { 'ptzz/lf.vim', commit = "eab8f04b2" }
  -- use { 'voldikss/vim-floaterm', commit = "e3f2d94" }

  -- Start Screen
  use { 'goolord/alpha-nvim', commit = "4781fcfea5ddc1a92d41b32dc325132ed6fce7a8"  }
  -- use { 'rmagatti/auto-session' }
  -- use { 'rmagatti/session-lens', requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'} }
  use { 'blaineventurine/sessionable', commit = "316fed5e97e8035584b9b8cca76660e8ae1c78f4" }

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
require("plugins.toggleterm")
require("plugins.treesitter")
require("sessionable").setup({
  session_dir = "$HOME/.local/share/nvim/session/",
  log_level = "debug"
})

vim.g.NERDSpaceDelims = 1
require'luasnip'.filetype_extend("ruby", {"rails"})
