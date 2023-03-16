local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "bashls",
  "clangd",
  "cssls",
  "denols",
  "emmet_ls",
  "html",
  "ltex",
  "lua_ls",
  "marksman",
  "pyright",
  "terraformls",
  "tsserver",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.elixirls.setup {
  cmd = { "/Users/andres/.local/share/nvim/mason/bin/elixir-ls" },
}
