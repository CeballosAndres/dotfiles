local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- Include the servers you want to have installed by default below
   local servers = {
      "html",
      "cssls",
      "bashls",
      "pyright",
      "tsserver",
      "emmet_ls",
      "sumneko_lua",
   }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = function(client, bufnr)
            attach(client, bufnr)
            if lsp == "pyright" then
               client.settings = {
                  pyright = {
                     reportUnusedFunction = false,
                  },
               }
            end
         end,
         capabilities = capabilities,
      }
   end
end

return M
