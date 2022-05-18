local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {

   -- webdev stuff
   b.formatting.deno_fmt,
   b.formatting.prettierd.with {
      filetypes = {
         "css",
         "graphql",
         "html",
         "json",
         "less",
         "markdown",
         "scss",
         "vue",
         "yaml",
      },
   },

   -- Git
   b.diagnostics.gitlint,
   b.code_actions.gitsigns,

   -- Docker
   b.diagnostics.hadolint,

   -- Lua
   b.formatting.stylua,
   -- b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- Elixir
   b.formatting.mix.with { args = { "format", "-" } },
   -- Python
   b.formatting.autopep8.with { filetypes = { "python" } },
   b.diagnostics.pylint.with {
      filetypes = {
         "python",
      },
      extra_args = { "--from-stdin", "$FILENAME", "-f", "json" },
   },
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,

      -- format on save
      on_attach = function(client)
         if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
         end
      end,
   }
end

return M
