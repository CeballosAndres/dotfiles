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
      "typescript",
      "vim",
      "yaml",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
}

M.telescope = {
   extensions = {
      -- fd is needed
      media_files = {
         filetypes = { "png", "webp", "jpg", "jpeg" },
      },
   },
}

M.gitsigns = {
   signs = {
      add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
      change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
      delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
      topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
      changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
   },
   current_line_blame = true,
   current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 500,
      ignore_whitespace = false,
   },
   current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
}

return M
