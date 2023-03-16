---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.hop = {
   n = {
      ["<leader>s"] = { "<cmd> HopWord <CR>", "x Hope Word" },
   },
}

M.test = {
   n = {
      ["<leader>tn"] = { "<cmd>TestNearest<CR>", "Test nearest test", opts = { noremap = true, silent = true } },
      ["<leader>tf"] = { "<cmd>TestFile<CR>", "Test file", opts = { noremap = true, silent = true } },
      ["<leader>ts"] = { "<cmd>TestSuite<CR>", "Test suite", opts = { noremap = true, silent = true } },
      ["<leader>tl"] = { "<cmd>TestLast<CR>", "Test last test run", opts = { noremap = true, silent = true } },
      ["<leader>tv"] = { "<cmd>TestVisit<CR>", "Test visit", opts = { noremap = true, silent = true } },
   },
}

return M
