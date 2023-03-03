local M = {}

M.plugins = require "custom.plugins"

M.ui = {
   theme_toggle = { "chadracula", "one_light" },
   theme = "chadracula",
}

M.mappings = require "custom.mappings"

return M
