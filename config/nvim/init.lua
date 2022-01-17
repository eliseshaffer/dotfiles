-- -------------------------------------------------------------------------------------------
--
-- General Settings
--
-- -------------------------------------------------------------------------------------------
vim.o.showtabline = 2
vim.o.sidescroll = 3
vim.o.autoread = true
vim.o.colorcolumn = "100"
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.writebackup = false
vim.o.undofile = false
vim.wo.number = true
vim.o.signcolumn = "yes"
vim.wo.relativenumber = true
vim.o.updatetime = 1000
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
vim.api.nvim_command([[
  autocmd WinEnter,FocusGained * :setlocal number relativenumber
  autocmd WinLeave,FocusLost   * :setlocal number norelativenumber
]])

vim.cmd([[
  autocmd CursorHold * :checktime
]])

if vim.fn.has("termguicolors") == 1 then
  vim.go.t_8f = "[[38;2;%lu;%lu;%lum"
  vim.go.t_8b = "[[48;2;%lu;%lu;%lum"
  vim.opt.termguicolors = true
end

-- -------------------------------------------------------------------------------------------
--
-- Plugin Configs
--
-- -------------------------------------------------------------------------------------------
require('plugins')
require('plugins.treesitter')
require('lsp')

vim.go.background = vim.env.COLOR
vim.api.nvim_command 'colorscheme one'

-- -------------------------------------------------------------------------------------------
--
-- Custom Functions
--
-- -------------------------------------------------------------------------------------------
function color_switch()
  local currentColor = vim.go.background
		if currentColor == 'dark' then
			vim.go.background = 'light'
  	else
			vim.go.background = 'dark'
		end
end

-- -------------------------------------------------------------------------------------------
--
-- Keymaps
--
-- -------------------------------------------------------------------------------------------
vim.g.mapleader = ","
vim.opt.mouse = "a"
local key = vim.api.nvim_set_keymap

-- OS Clipboard
-- -------------------------------------------------------------------------------------------
key('v', '<leader>c', '"*y<CR>', {})
key('n', '<leader>v', '"*p', {})
-- -------------------------------------------------------------------------------------------

-- Colors
-- -------------------------------------------------------------------------------------------
key('n', '<leader>kt', ":lua color_switch()<CR>", { noremap = true})

-- Files (NvimTree / Telescope)
-- -------------------------------------------------------------------------------------------
key('n', '<leader>ft', ":NvimTreeToggle<CR>", { noremap = false })
key('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", { noremap = false })
key('n', '<leader>fg', ":lua require('telescope.builtin').git_files()<CR>", { noremap = false })
key('n', '<leader>s', ":lua require('telescope.builtin').grep_string()<CR>", { noremap = false })
-- -------------------------------------------------------------------------------------------

-- Tests (vim-test)
-- -------------------------------------------------------------------------------------------
key('n', '<leader>ts', ":TestSuite<CR>", { noremap = false })
key('n', '<leader>tf', ":TestFile<CR>", { noremap = false })
key('n', '<leader>tn', ":TestNearest<CR>", { noremap = false })
key('n', '<leader>tl', ":TestLast<CR>", { noremap = false })
-- -------------------------------------------------------------------------------------------

-- Line Movement (move.nvim)
--   - I don't have the correct character for Alt-H and Alt-L
--   - Alt maps don't work on Mac withouth the special characters
-- -------------------------------------------------------------------------------------------
key('n', '∆', ":MoveLine(1)<CR>", { noremap = true, silent = true })
key('n', '˚', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
key('v', '∆', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
key('v', '˚', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<A-j>', ":MoveLine(1)<CR>", { noremap = true, silent = true })
-- key('n', 'A-h', ":MoveHChar(1)<CR>", { noremap = true, silent = true })
-- key('n', 'A-l', ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
-- key('v', 'A-h', ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
-- key('v', 'A-l', ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })
-- -------------------------------------------------------------------------------------------

-- Code Navigation (LSP)
-- -------------------------------------------------------------------------------------------
key('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true})
key('n', '<leader>gD', ':lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true})
key('n', '<leader>gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true})
key('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true})
key('n', '<leader>F', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true})
key('n', '<C-k>', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true, silent = true})
-- key('n', '<C-[>', ':lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true})
-- key('n', '<C-]>', ':lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true})
-- -------------------------------------------------------------------------------------------

-- Markdown Preview (Glow)
-- -------------------------------------------------------------------------------------------
key('n', '<leader>md', ':Glow<CR>', { noremap = true, silent = true})
-- -------------------------------------------------------------------------------------------
