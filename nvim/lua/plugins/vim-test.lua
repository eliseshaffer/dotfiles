return {
  'vim-test/vim-test',
  config = function()
    vim.g['test#strategy'] = "neovim"
    vim.g['test#neovim#term_position'] = "vert bo 100"
  end
}
