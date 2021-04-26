require('lualine').setup{
  -- options = { theme = 'everforest'}
  options = { theme = 'tokyonight'}
}


local lspconfig = require("lspconfig")
local lspinstall = require('lspinstall')
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

local function setup_servers()
  lspinstall.setup()
  local servers = lspinstall.installed_servers()
  for _, server in pairs(servers) do
    lspconfig[server].setup { on_attach = on_attach }
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
