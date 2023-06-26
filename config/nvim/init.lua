-- -------------------------------------------------------------------------------------------
--
-- General Settings
--
-- -------------------------------------------------------------------------------------------
vim.o.showtabline = 2
vim.o.laststatus = 3
vim.o.sidescroll = 3
vim.o.autoread = true
vim.o.colorcolumn = "100"
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.writebackup = false
vim.o.undofile = false
vim.wo.number = true
vim.wo.wrap = false
vim.o.signcolumn = "auto:4"
vim.wo.relativenumber = true
vim.o.updatetime = 1000
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
vim.api.nvim_command([[
  autocmd WinEnter,FocusGained * :setlocal number relativenumber
  autocmd WinLeave,FocusLost   * :setlocal number norelativenumber
  autocmd BufRead *.rbs :setlocal ft=rbs
]])

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.turbo_stream.erb",
  command = "setlocal ft=eruby.html"
})

vim.cmd([[
  autocmd CursorHold * :checktime
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'neo-tree filesystem [' . tabpagenr() . ']' | quit | endif
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
key('v', '<leader>c', '"*y<CR>', { desc = "Copy To Clipboard" })
key('n', '<leader>v', '"*p', { desc = "Paste From Clipboard" })
-- -------------------------------------------------------------------------------------------

-- Colors
-- -------------------------------------------------------------------------------------------
key('n', '<leader>kt', ":DarkLightSwitch<CR>", { noremap = true, desc = "Toggle Night Mode" })
key('n', '<leader>dl', ":DarkLightSwitch<CR>", { noremap = true, desc = "Toggle Night Mode" })

-- Files (NvimTree / Telescope)
-- -------------------------------------------------------------------------------------------
-- key('n', '<leader>ft', ":Telescope file_browser initial_mode=normal<CR>", { noremap = false })
key('n', '<leader>ft', ":Neotree toggle<CR>", { noremap = false, desc = "File Tree" })
key('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", { noremap = false, desc = "Find Files" })
key('n', '<leader>fa', ":Telescope find_files find_command=rg,--hidden,--files<CR>",
  { noremap = false, desc = "Find All Files" })
key('n', '<leader>fg', ":lua require('telescope.builtin').git_files()<CR>", { noremap = false, desc = "Find Git Files" })
key('n', '<leader>fs', ":SearchSession<CR>", { noremap = false, desc = "Find Session" })
key('n', '<leader>s', ":lua require('telescope.builtin').live_grep()<CR>", { noremap = false, desc = "Search Text" })
-- -------------------------------------------------------------------------------------------

-- Tests (vim-test)
-- -------------------------------------------------------------------------------------------
key('n', '<leader>ts', ":TestSuite<CR>", { noremap = false, desc = "Run Test Suite" })
key('n', '<leader>tf', ":TestFile<CR>", { noremap = false, desc = "Run Tests For Current File" })
key('n', '<leader>tn', ":TestNearest<CR>", { noremap = false, desc = "Run Nearest Test" })
key('n', '<leader>tl', ":TestLast<CR>", { noremap = false, desc = "Run Last Test" })
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
key('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true, desc = "Go To Definition" })
key('n', '<leader>gD', ':lua vim.lsp.buf.declaration()<CR>',
  { noremap = true, silent = true, desc = "Go To Declaration" })
key('n', '<leader>gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true, desc = "List References" })
key('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>',
  { noremap = true, silent = true, desc = "Goto Implementation" })
key('n', '<leader>F', ':lua vim.lsp.buf.format({ async = true})<CR>',
  { noremap = true, silent = true, desc = "Format File" })
key('n', '<C-k>', ':lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true, desc = "Show Line diagnostics" })
-- key('n', '<C-[>', ':lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true})
-- key('n', '<C-]>', ':lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true})
-- -------------------------------------------------------------------------------------------

-- Markdown Preview (Glow)
-- -------------------------------------------------------------------------------------------
key('n', '<leader>md', ':Glow<CR>', { noremap = true, silent = true, desc = "Preview markdown" })
-- -------------------------------------------------------------------------------------------

-- Git Tools
-- -------------------------------------------------------------------------------------------
key('n', '<leader>gc', ':GetCommitLink<CR>', { noremap = true, silent = true, desc = "Get Commit Link" })
key('v', '<leader>gc', ':GetCommitLink<CR>', { noremap = true, silent = true, desc = "Get Commit Link" })
key('n', '<leader>gs', ':Neogit kind=vsplit<CR>', { noremap = true, silent = true, desc = "Git Status" })
key('v', '<leader>gs', ':Neogit king=vsplit<CR>', { noremap = true, silent = true, desc = "Git Status" })
key('n', '<leader>gr', ':DiffviewOpen main<CR>', { noremap = true, silent = true, desc = "Diff Main Branch" })
key('v', '<leader>gr', ':DiffviewOpen main<CR>', { noremap = true, silent = true, desc = "Diff Main Branch" })
key('n', '<leader>gR', ':DiffviewOpen master<CR>', { noremap = true, silent = true, desc = "Diff Main Branch" })
key('v', '<leader>gR', ':DiffviewOpen master<CR>', { noremap = true, silent = true, desc = "Diff Main Branch" })
-- -------------------------------------------------------------------------------------------

-- Terminal
-- -------------------------------------------------------------------------------------------
-- key('n', '<C-}>', ':ToggleTerm size=20 dir=~/Desktop direction=horizontal<CR>', { noremap = false, silent = true})
-- key('n', '<C-\>', ':ToggleTerm size=80 dir=~/Desktop direction=float<CR>', { noremap = false, silent = true})
-- -------------------------------------------------------------------------------------------

-- Quit Vim
-- -------------------------------------------------------------------------------------------
key('n', '<leader>Q', ':wqa<CR>', { noremap = true, silent = true, desc = "Save And Quit" })
key('v', '<leader>Q', ':wqa<CR>', { noremap = true, silent = true, desc = "Save And Quit" })
-- -------------------------------------------------------------------------------------------
