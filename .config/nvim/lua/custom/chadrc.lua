---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "catppuccin" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    theme = "vscode_colored",   -- default/vscode/vscode_colored/minimal

    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    overriden_modules = nil,
  },
  changed_themes = {
    one_ligth = {
      base_16 = {
        base00 = "#eff1f5",     -- base
        base01 = "#e6e9ef",     -- mantle
        base02 = "#ccd0da",     -- surface0
        base03 = "#bcc0cc",     -- surface1
        base04 = "#acb0be",     -- surface2
        base05 = "#4c4f69",     -- text
        base06 = "#dc8a78",     -- rosewater
        base07 = "#7287fd",     -- lavender
        base08 = "#d20f39",     -- red
        base09 = "#fe640b",     -- peach
        base0A = "#df8e1d",     -- yellow
        base0B = "#40a02b",     -- green
        base0C = "#179299",     -- teal
        base0D = "#1e66f5",     -- blue
        base0E = "#8839ef",     -- mauve
        base0F = "#dd7878",     -- flamingo
      },
      base_30 = {
        white = "#acb0be",
      },
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
