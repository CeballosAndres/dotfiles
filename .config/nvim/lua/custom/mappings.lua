---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>m"] = { "<cmd>!mix build<CR>", "Build for Mix", opts = { nowait = false, silent = true } },
    ["<leader>gl"] = {
      "<cmd>!lab project browse<CR>",
      "Open gitlab project on browser",
      opts = { nowait = false, silent = true },
    },
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
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

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

return M
