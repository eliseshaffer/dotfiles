if vim.fn.has("termguicolors") == 1 then
  vim.go.t_8f = "[[38;2;%lu;%lu;%lum"
  vim.go.t_8b = "[[48;2;%lu;%lu;%lum"
  vim.opt.termguicolors = true
end

require('plugins')
require('plugins.treesitter')
require('lsp')

-- Settings 
vim.o.showtabline = 2
vim.o.sidescroll = 3
vim.o.tabstop = 2
vim.wo.number = true
vim.wo.relativenumber = true
vim.api.nvim_command([[
  autocmd WinEnter,FocusGained * :setlocal number relativenumber
  autocmd WinLeave,FocusLost   * :setlocal number norelativenumber
]])

vim.cmd 'colorscheme one'
vim.g.background = 'dark'

-- Keymaps
vim.g.mapleader = ","
vim.opt.mouse = "a"
local key = vim.api.nvim_set_keymap

-- OS Clipboard
key('v', '<leader>c', '"*y<CR>', {})
key('n', '<leader>v', '"*p', {})

-- NvimTree / Telescope
key('n', '<leader>ft', ":NvimTreeToggle<CR>", { noremap = false })
key('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", { noremap = false })
key('n', '<leader>fg', ":lua require('telescope.builtin').git_files()<CR>", { noremap = false })
key('n', '<leader>s', ":lua require('telescope.builtin').grep_string()<CR>", { noremap = false })

-- vim-test
key('n', '<leader>ts', ":TestSuite<CR>", { noremap = false })
key('n', '<leader>tf', ":TestFile<CR>", { noremap = false })
key('n', '<leader>tn', ":TestNearest<CR>", { noremap = false })

