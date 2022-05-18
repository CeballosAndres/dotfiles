local M = {}

M.truzen = {
   n = {
      ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "   truzen ataraxis" },
      ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "   truzen minimal" },
      ["<leader>tf"] = { "<cmd> TZFocus <CR>", "   truzen focus" },
   },
}

M.telescope = {
   n = {
      ["<leader>tt"] = { "<cmd> Telescope <CR>", "🔍 Telescope" },
   },
}

return M

-- -- Misc
-- map("n", "<leader>q", ":q <CR>")
-- map("n", "<leader>w", ":w <CR>")
--
-- -- Hop
-- map("n", "<leader>s", ":HopWord <CR>")
