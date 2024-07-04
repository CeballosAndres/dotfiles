local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
   "bashls",
   "cssls",
   "denols",
   "html",
   "ltex",
   "lua_ls",
   "marksman",
   "pyright",
   "tailwindcss",
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
   cmd = { vim.fn.expand "~/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
   on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
      client.server_capabilities.documentRangeFormattingProvider = true
      client.server_capabilities.hoverProvider = true

      require("core.utils").load_mappings("lspconfig", { buffer = bufnr })

      if client.server_capabilities.signatureHelpProvider then
         require("nvchad_ui.signature").setup(client)
      end
   end,
   capabilities = capabilities,
   -- settings = {
   --    elixirLS = {
   --       dialyzerEnabled = false,
   --       fetchDeps = false,
   --    },
   -- },
}
lspconfig.emmet_ls.setup {
   capabilities = capabilities,
   on_attach = on_attach,
   filetypes = {
      "html",
      "typescriptreact",
      "javascriptreact",
      "css",
      "sass",
      "scss",
      "less",
      "eruby",
      "heex",
      "elixir",
      "eelixir",
   },
}
