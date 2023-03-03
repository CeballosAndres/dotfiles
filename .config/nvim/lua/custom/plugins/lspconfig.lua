local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
      "bashls",
      "cssls",
      "denols",
      "elixirls",
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
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  if lsp == "elixirls" then
    opts.cmd = {"/Users/andres/.local/share/nvim/mason/bin/elixir-ls"}
  end
  lspconfig[lsp].setup(opts)
end
