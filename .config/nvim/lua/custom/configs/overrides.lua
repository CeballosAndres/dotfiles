local M = {}

M.treesitter = {
   ignore_install = { "help" },
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
      "markdown_inline",
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
   highlight = {
      enable = true,
      use_languagetree = true,
   },

   indent = { enable = true },
   -- highlight = {
   --    enable = true,
   -- },
   -- indent = {
   --    enable = true,
   --    disable = {
   --       "elixir",
   --    },
   -- },
}

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
      "black",
      "mypy",
      "debugpy",
      "ruff",
      "sqlfluff",
      "python-lsp-server",
      "stylua",
      "terraform-ls",
      "typescript-language-server",
      "yaml-language-server",
      "tailwindcss-language-server",
   },
}

-- git support in nvimtree
M.nvimtree = {
   git = {
      enable = true,
   },

   renderer = {
      highlight_git = true,
      icons = {
         show = {
            git = true,
         },
      },
   },
}

return M
