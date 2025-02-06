local on_attach = require('vishal.utils.on_attach')
local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

nvim_lsp['pyright'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
