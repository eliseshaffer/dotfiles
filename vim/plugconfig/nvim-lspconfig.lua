local lspconfig = require'lspconfig'
lspconfig.solargraph.setup{}

--local nvim_lsp = require('lspconfig')
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = false,
        signs = true,
        underline = true
    }
)
lspconfig.sorbet.setup{}
lspconfig.eslint.setup{}
  --settings = {
    --codeActionOnSave = {
      --enable = true,
      --mode = "all"
    --},
  --}
--}
