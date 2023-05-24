local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- require('lspkind').init()

-- Diagnostics symbols for display in the sign column.
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

nvim_lsp.html.setup {
  filetypes = {"html", "eruby"},
  capabilities = capabilities
}
nvim_lsp.tsserver.setup{
  capabilities = capabilities
}
nvim_lsp.solargraph.setup{
  capabilities = capabilities
}

nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
-- nvim_lsp.steep.setup{}

nvim_lsp.cssls.setup{
  capabilities = capabilities
}
nvim_lsp.dockerls.setup{
  capabilities = capabilities
}
nvim_lsp.jsonls.setup{
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  },
  capabilities = capabilities
}
nvim_lsp.yamlls.setup{
  capabilities = capabilities
}
nvim_lsp.vimls.setup{
  capabilities = capabilities
}
nvim_lsp.eslint.setup{
    on_attach = function(client, buffer)
        -- nvim_lsp.services.commmon_on_attach(client, bufnr)
        client.resolved_capabilities.document_formatting = true
        --vim.cmd('autocmd BufWritePre <buffer> EslintFixAll')
    end
}
-- nvim_lsp.sorbet.setup{
  -- capabilities = capabilities
-- }

