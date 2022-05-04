local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')
-- local gps = require("nvim-gps")
-- local package = require("package-info")

local force_inactive = {
  filetypes = {},
  buftypes = {},
  bufnames = {}
}

local components = {
  active = {{}, {}, {}},
  inactive = {{}, {}, {}},
}

local dark = {
  bg = '#272c33',
  black = '#272c33',
  yellow = '#e5c07b',
  cyan = '#56b6c2',
  oceanblue = '#45707a',
  green = '#98c379',
  orange = '#e5c07b',
  violet = '#c678dd',
  magenta = '#c14a4a',
  white = '#dedede',
  fg = '#abb2bf',
  skyblue = '#61afef',
  red = '#ea6962',
}

local light = {
  fg = '#494b53',
  black = '#272c33',
  yellow = '#d19a66',
  cyan = '#0184bc',
  oceanblue = '#4078f2',
  green = '#50a14f',
  orange = '#986801',
  violet = '#a626a4',
  magenta = '#c14a4a',
  white = '#fafafa',
  bg = '#fafafa',
  skyblue = '#7daea3',
  red = '#ca1243',
}

local vi_mode_colors = {
  NORMAL = 'green',
  OP = 'green',
  INSERT = 'red',
  VISUAL = 'skyblue',
  LINES = 'skyblue',
  BLOCK = 'skyblue',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'green',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow'
}

local vi_mode_text = {
  NORMAL = '<|',
  OP = '<|',
  INSERT = '|>',
  VISUAL = '<>',
  LINES = '<>',
  BLOCK = '<>',
  REPLACE = '<>',
  ['V-REPLACE'] = '<>',
  ENTER = '<>',
  MORE = '<>',
  SELECT = '<>',
  COMMAND = '<|',
  SHELL = '<|',
  TERM = '<|',
  NONE = '<>'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame'
}

force_inactive.buftypes = {
  'terminal'
}

-- LEFT

-- vi-mode
components.active[1][1] = {
  provider = function()
		--return " " .. string.sub(vi_mode_utils.get_vim_mode(), 1, 1) .. " "
	  return "  " -- .. string.sub(vi_mode_utils.get_vim_mode(), 1, 1) .. " "
  end,
  hl = function()
    local val = {}

    val.bg = vi_mode_utils.get_mode_color()
    val.fg = 'bg'
    val.style = 'NONE'

    return val
  end,
  right_sep = ' '
}
-- vi-symbol
--components.active[1][2] = {
  --provider = function()
    --return vi_mode_text[vi_mode_utils.get_vim_mode()]
  --end,
  --hl = function()
    --local val = {}
    --val.fg = vi_mode_utils.get_mode_color()
    --val.bg = 'bg'
    --val.style = 'NONE'
    --return val
  --end,
  --right_sep = ' '
--}
-- filename
components.active[1][7] = {
  provider = function()
    return vim.fn.expand("%:F")
  end,
  hl = {
    fg = 'fg',
    bg = 'bg',
    style = 'NONE'
  }
  --right_sep = {
    --str = ' > ',
    --hl = {
      --fg = 'fg',
      --bg = 'bg',
      --style = 'NONE'
    --},
  --}
}

-- gitBranch
components.active[1][2] = {
  provider = 'git_branch',
  hl = {
    fg = 'violet',
    bg = 'bg',
    style = 'NONE'
  },
}
-- diffAdd
components.active[1][3] = {
  provider = 'git_diff_added',
  hl = {
    fg = 'green',
    bg = 'bg',
    style = 'NONE'
  },
}
-- diffModfified
components.active[1][4] = {
  provider = 'git_diff_changed',
  hl = {
    fg = 'orange',
    bg = 'bg',
    style = 'NONE'
  },
}
-- diffRemove
components.active[1][5] = {
  provider = 'git_diff_removed',
  hl = {
    fg = 'red',
    bg = 'bg',
    style = 'NONE'
  },
}

components.active[1][6] = {
  provider = function()
    return "_"
  end,
  hl = {
    fg = 'bg',
    bg = 'bg',
    style = 'NONE'
  }
}
-- diagnosticErrors
components.active[2][5] = {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,
  hl = {
    fg = 'red',
    style = 'NONE'
  }
}
-- diagnosticWarn
components.active[2][6] = {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
  hl = {
    fg = 'yellow',
    style = 'NONE'
  }
}
-- diagnosticHint
components.active[2][7] = {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
  hl = {
    fg = 'cyan',
    style = 'NONE'
  }
}
-- diagnosticInfo
components.active[2][8] = {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.INFO) end,
  hl = {
    fg = 'skyblue',
    style = 'NONE'
  }
}
-- package-info
-- components.active[2][9] = {
  -- provider = function()
	  -- return '' end
        -- return package.get_status() end,
    -- hl = {
        -- style = "NONE",
    -- },
    -- left_sep = "  ",
    -- right_sep = " ",
-- }
-- RIGHT

-- LspName
components.active[3][1] = {
  provider = 'lsp_client_names',
  hl = {
    fg = 'yellow',
    bg = 'bg',
    style = 'NONE'
  },
  right_sep = ' '
}
-- fileIcon
components.active[3][2] = {
  provider = function()
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon == nil then
      icon = ''
    end
    return icon
  end,
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'fg'
    end
    val.bg = 'bg'
    val.style = 'NONE'
    return val
  end,
  right_sep = ' '
}
-- fileType
components.active[3][3] = {
  provider = 'file_type',
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'fg'
    end
    val.bg = 'bg'
    val.style = 'NONE'
    return val
  end,
  right_sep = ' '
}
-- fileSize
components.active[3][4] = {
  provider = 'file_size',
  enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
  hl = {
    fg = 'skyblue',
    bg = 'bg',
    style = 'NONE'
  },
  right_sep = ' '
}
-- fileFormat
components.inactive[3][5] = {
  provider = function() return '' .. vim.bo.fileformat:upper() .. '' end,
  hl = {
    fg = 'fg',
    bg = 'bg',
    style = 'NONE'
  },
  right_sep = ' '
}
-- fileEncode
components.active[3][5] = {
  provider = 'file_encoding',
  hl = {
    fg = 'green',
    bg = 'bg',
    style = 'NONE'
  },
  right_sep = ' '
}
-- rubyVersion
-- components.active[3][7] = {
--   provider = function()
--     return ' '..vim.fn['rvm#string']()
--   end,
--   hl = {
--     fg = 'red',
--     bg = 'bg',
--     style = 'NONE'
--   },
--   right_sep = ' '
-- }
components.active[3][6] = {}
-- lineInfo
components.inactive[3][7] = {
  provider = 'position',
  hl = {
    fg = 'fg',
    bg = 'bg',
    style = 'NONE'
  },
  right_sep = ' '
}
-- linePercent
components.active[3][7] = {
  provider = 'line_percentage',
  hl = {
    fg = 'fg',
    bg = 'bg',
    style = 'NONE'
  },
  right_sep = ' '
}
-- scrollBar
components.active[3][8] = {
  provider = 'scroll_bar',
  hl = {
    fg = 'yellow',
    bg = 'bg',
  },
}

-- INACTIVE

-- fileType
components.inactive[1][1] = {
  provider = 'file_type',
  hl = {
    fg = 'black',
    bg = 'cyan',
    style = 'NONE'
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = 'NONE',
      bg = 'cyan'
    }
  },
  right_sep = {
    {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'cyan'
      }
    },
    ' '
  }
}

require('feline').setup({
  theme = dark,
  default_bg = bg,
  default_fg = fg,
  vi_mode_colors = vi_mode_colors,
  components = components,
  force_inactive = force_inactive,
})
require('feline').add_theme('dark', dark)
require('feline').add_theme('light', light)
