local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
  require'completion'.on_attach(client)
end

nvim_lsp.vimls.setup({ on_attach = on_attach })
nvim_lsp.rust_analyzer.setup({ on_attach = on_attach })

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
