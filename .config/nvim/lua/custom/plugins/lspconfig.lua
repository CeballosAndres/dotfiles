local M = {}

M.setup_lsp = function(attach, capabilities)
	local lspconfig = require("lspconfig")

	-- Include the servers you want to have installed by default below
	local servers = {
		"bashls",
		"cssls",
		"emmet_ls",
		"ltex",
		"html",
		"pyright",
		"sumneko_lua",
		"tsserver",
	}

	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = function(client, bufnr)
				attach(client, bufnr)
				if lsp == "pyright" then
					client.settings = {
						pyright = {
							reportUnusedFunction = false,
						},
					}
				end
				-- if lsp == "grammarly" then
				-- 	client.filetypes = { "markdown", "python", "html" }
				-- end
			end,
			capabilities = capabilities,
		})
	end
end

return M
