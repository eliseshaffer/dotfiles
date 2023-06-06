require("catppuccin").setup({
  flavour = "macchiato",
  background = {
    -- :h background
    light = "latte",
    dark = "macchiato",
  },
  integrations = {
    cmp = true,
    alpha = true,
    gitsigns = true,
    neotree = true,
    neogit = true,
    telescope = true,
    notify = false,
    mini = false,
    which_key = true,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

vim.cmd [[colorscheme catppuccin]]

