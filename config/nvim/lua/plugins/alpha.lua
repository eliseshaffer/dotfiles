local dashboard = require"alpha.themes.dashboard"
math.randomseed(os.time())

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "Function"
  b.opts.hl_shortcut = "Type"
  return b
end

local function footer()
	-- TODO: Figure out why this doesn't work			
  local total_plugins = "X" -- #vim.tbl_keys(packer_plugins)
  local date = os.date("%d-%m-%Y")
  local time = os.date("%H:%M:%S")
  return "[ " .. total_plugins .. " plugins] [ " .. date .. "] [ " .. time .. "]"
end

local custom_header = {
    type = "text",
    val = {
      [[     ,dPYb,              ,dPYb, ,dPYb,                           ,dPYb,]],
      [[     IP'`Yb              IP'`Yb IP'`Yb                           IP'`Yb]],
      [[     I8  8I              I8  8I I8  8I                           I8  8I  gg]],
      [[     I8  8'              I8  8' I8  8'                           I8  8'  ""]],
      [[     I8 dPgg,    ,ggg,   I8 dP  I8 dP    ,ggggg,         ,ggg,   I8 dP   gg     ,g,      ,ggg,]],
      [[     I8dP" "8I  i8" "8i  I8dP   I8dP    dP"  "Y8ggg     i8" "8i  I8dP    88    ,8'8,    i8" "8i]],
      [[     I8P    I8  I8, ,8I  I8P    I8P    i8'    ,8I       I8, ,8I  I8P     88   ,8'  Yb   I8, ,8I]],
      [[    ,d8     I8, `YbadP' ,d8b,_ ,d8b,_ ,d8,   ,d8'       `YbadP' ,d8b,_ _,88,_,8'_   8)  `YbadP']],
      [[    88P     `Y8888P"Y8888P'"Y888P'"Y88P"Y8888P"        888P"Y8888P'"Y888P""Y8P' "YY8P8P888P"Y888]],
    },
    opts = {
        position = "center",
        hl = "Type",
    },
}

dashboard.section.buttons.val = {
  button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  button("f", "  Find file", ":lua require('telescope.builtin').find_files()<CR>"),
  button("p", "  Plugins", ":e ~/.config/nvim/lua/plugins.lua<CR>"),
  button("u", "  Sync plugins", ":PackerSync<CR>"),
  button("q", "  Quit", "<Cmd>qa<CR>"),
  button("l", "λ  Update laguage servers", ":LspUpdate<CR>")
}

-- TODO: When I tried to set the value of the whole header, it didn't work. I 
-- just got the default header, but if I only set the val property, it worked
-- Why couldn't I set the whole thing?
dashboard.section.header.val = custom_header.val
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

require"alpha".setup(dashboard.opts)

-- hide tabline on startup screen
vim.cmd [[
augroup alpha_tabline
  au!
  au FileType alpha set showtabline=0 | au BufUnload <buffer> set showtabline=2
augroup END
]]