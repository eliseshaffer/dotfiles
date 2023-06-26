local devicons = require('nvim-web-devicons')
local M = {}

local function create_tab(tab_id)
  local tab = ""
  local current = vim.api.nvim_get_current_tabpage()
  local win_count = #vim.api.nvim_tabpage_list_wins(tab_id)

  local win = vim.api.nvim_tabpage_get_win(tab_id)
  local buf = vim.api.nvim_win_get_buf(win)
  local bufname = vim.api.nvim_buf_get_name(buf)
  local extension = vim.fn.fnamemodify(bufname, ':e')
  local icon = devicons.get_icon(bufname, extension, { default = true })
  local shortname = vim.fn.fnamemodify(bufname, ':~:.')
  local place = vim.api.nvim_tabpage_get_number(tab_id)
  local hl = ""

  if tab_id == current then
    hl = "%#Normal#"
  else
    hl = "%#TabLine#"
  end

  tab = hl .. "%" .. place .. "T ".. win_count .. hl .. "  " .. "%#DevIconLua#" .. icon .. hl .. " " ..
      vim.fn.pathshorten(shortname) .. "  %" .. place .. "X—%X "
  return tab
end

local function set_tabline()
  local tabline = ""
  local tabpages = vim.api.nvim_list_tabpages()
  for _, tab in ipairs(tabpages) do
    tabline = tabline .. create_tab(tab) .. "%#TabLine#"
  end
  return tabline
end

M.setup = function()
end

function _G.nvim_tabline()
  return set_tabline()
end

vim.o.tabline = '%!v:lua.nvim_tabline()'

return M
