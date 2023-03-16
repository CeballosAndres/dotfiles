local overrides = require "custom.plugins.overrides"

return {
   ["phaazon/hop.nvim"] = {
      branch = "v1", -- optional but strongly recommended
      config = function()
         require "custom.plugins.hop"
      end,
   },
   ["vim-test/vim-test"] = {},
   -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

   -- Override plugin definition options
   ["neovim/nvim-lspconfig"] = {
      config = function()
         require "plugins.configs.lspconfig"
         require "custom.plugins.lspconfig"
      end,
   },

   ["kylechui/nvim-surround"] = {
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
         require("nvim-surround").setup {
            -- Configuration here, or leave empty to use defaults
         }
      end,
   },

   -- overrde plugin configs
   ["nvim-treesitter/nvim-treesitter"] = {
      override_options = overrides.treesitter,
   },

   ["williamboman/mason.nvim"] = {
      override_options = overrides.mason,
   },

   -- Install a plugin
   ["max397574/better-escape.nvim"] = {
      event = "InsertEnter",
      config = function()
         require("better_escape").setup()
      end,
   },

   -- code formatting, linting etc
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
   },

   -- code formatting, linting etc
   ["wakatime/vim-wakatime"] = {},
}
