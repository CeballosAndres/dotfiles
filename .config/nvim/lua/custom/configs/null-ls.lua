local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {

   -- webdev stuff
   b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
   b.formatting.prettierd.with {
      filetypes = {
         "css",
         "graphql",
         "html",
         "json",
         "less",
         "markdown",
         "scss",
         -- "sqlfluff",
         "vue",
         "yaml",
      },
   }, -- so prettier works only on these filetypes

   -- Git
   b.diagnostics.gitlint,
   b.code_actions.gitsigns,

   -- SQL
   b.formatting.sqlfluff.with { extra_args = { "--dialect", "mysql" } },
   b.formatting.sql_formatter,

   -- Docker
   b.diagnostics.hadolint,

   -- Lua
   b.formatting.stylua,

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- Elixir
   -- b.formatting.mix.with { args = { "format", "-" } },
   -- Python
   b.formatting.autopep8.with {
      filetypes = { "python" },
      extra_args = { "--max-line-length", "100", "--experimental" },
   },
   b.diagnostics.pylint,
   -- b.formatting.black,
   -- b.diagnostics.mypy,
   -- b.diagnostics.ruff,
   b.formatting.terraform_fmt,
   -- cpp
   b.formatting.clang_format,
}

null_ls.setup {
   debug = true,
   sources = sources,
   -- format on save
   on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
         vim.api.nvim_clear_autocmds {
            group = augroup,
            buffer = bufnr,
         }
         vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
               vim.lsp.buf.format { bufnr = bufnr }
            end,
         })
      end
   end,
}
