-- overriding default plugin configs!

local M = {}

M.treesitter = {
   ensure_installed = {
      "bash",
      "c",
      "css",
      "dockerfile",
      "eex",
      "elixir",
      "erlang",
      "go",
      "graphql",
      "hcl",
      "heex",
      "help",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "ninja",
      "norg",
      "php",
      "python",
      "regex",
      "scss",
      "toml",
      "terraform",
      "typescript",
      "vim",
      "yaml",
   },
}

-- -- git support in nvimtree
-- M.nvimtree = {
--    git = {
--       enable = true,
--    },
--
--    renderer = {
--       highlight_git = true,
--       icons = {
--          show = {
--             git = true,
--          },
--       },
--    },
-- }

M.mason = {
   ensure_installed = {
      "bash-language-server",
      "css-lsp",
      "deno",
      "elixir-ls",
      "emmet-ls",
      "html-lsp",
      "ltex-ls",
      "lua-language-server",
      "marksman",
      "pylint",
      "pyright",
      "python-lsp-server",
      "stylua",
      "terraform-ls",
      "typescript-language-server",
      "yaml-language-server",
   },
}

return M
