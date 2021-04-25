require('lualine').setup{
  -- options = { theme = 'everforest'}
  options = { theme = 'tokyonight'}
}


local nvim_lsp = require("lspconfig")
local saga = require 'lspsaga'
saga.init_lsp_saga {
  error_sign = "ⓧ",
  warn_sign = "⚠",
  hint_sign = "ⓘ",
  infor_sign = "ⓘ",
}

-- function to attach completion when setting up lsp
local on_attach = function(client)
  require'completion'.on_attach(client)
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "rust_analyzer" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
