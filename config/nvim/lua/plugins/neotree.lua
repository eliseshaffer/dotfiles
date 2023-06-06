vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require('neo-tree').setup({
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(arg)
        vim.cmd [[
          setlocal relativenumber
        ]]
      end,
    }
  },
  window = {
    position = "right",
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<space>"] = {
        "toggle_node",
        nowait = false,   -- disable `nowait` if you have existing combos starting with this char that you want to use
      },
      ["<2-LeftMouse>"] = "open",
      ["<cr>"] = "open",
      ["<esc>"] = "revert_preview",
      ["P"] = { "toggle_preview", config = { use_float = true } },
      ["l"] = "focus_preview",
      -- ["<C-s>"] = "open_split",
      -- ["<C-v>"] = "open_vsplit",
      ["<C-s>"] = "split_with_window_picker",
      ["<C-v>"] = "vsplit_with_window_picker",
      ["<C-t>"] = "open_tabnew",
      -- ["<cr>"] = "open_drop",
      -- ["t"] = "open_tab_drop",
      ["w"] = "open_with_window_picker",
      --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
      ["C"] = "close_node",
      -- ['C'] = 'close_all_subnodes',
      ["z"] = "close_all_nodes",
      --["Z"] = "expand_all_nodes",
      ["a"] = {
        "add",
        -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
          show_path = "relative"   -- "none", "relative", "absolute"
        }
      },
      ["A"] = "add_directory",   -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy",   -- takes text input for destination, also accepts the optional config.show_path option like "add":
      -- ["c"] = {
      --  "copy",
      --  config = {
      --    show_path = "none" -- "none", "relative", "absolute"
      --  }
      --}
      ["m"] = "move",   -- takes text input for destination, also accepts the optional config.show_path option like "add".
      ["q"] = "close_window",
      ["R"] = "refresh",
      ["?"] = "show_help",
      ["<"] = "prev_source",
      [">"] = "next_source",
    },
  },
  filesystem = {
    follow_current_file = true,
    filtered_items = {
      visible = true,   -- when true, they will just be displayed differently than normal items
      hide_dotfiles = true,
      hide_gitignored = true,
      show_hidden_count = true,
      hide_hidden = false,
      never_show = {   -- remains hidden even if visible is toggled to true, this overrides always_show
        ".DS_Store",
        "thumbs.db",
        ".git",
      },
    }
  }
})

vim.cmd([[
autocmd ColorScheme * highlight! link NeoTreeTabInactive NvimTreeNormal
autocmd ColorScheme * highlight! link NeoTreeTitleBar NvimTreeNormal
autocmd ColorScheme * highlight! link NeoTreeNormal NvimTreeNormal
autocmd ColorScheme * highlight! link NeoTreeCursorLine Normal
autocmd ColorScheme * highlight! link NeoTreeNormalNC NvimTreeNormal
highlight! link NeoTreeTabInactive NvimTreeNormal
highlight! link NeoTreeTitleBar NvimTreeNormal
highlight! link NeoTreeNormal NvimTreeNormal
highlight! link NeoTreeCursorLine Normal
highlight! link NeoTreeNormalNC NvimTreeNormal
]])
