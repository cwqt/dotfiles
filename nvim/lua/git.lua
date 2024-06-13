local M = {}

M.setup = function()
  require("gitlinker").setup({
    opts = { print_url = true, },
    mappings = "<leader>gy",
  })

  -- Conflict markers
  map("n", "]x", "<cmd>GitConflictNextConflict<CR>")
  map("n", "[x", "<cmd>GitConflictPrevConflict<CR>")
  map("n", "<leader>xo", "<cmd>GitConflictChooseOurs<CR>")
  map("n", "<leader>xt", "<cmd>GitConflictChooseTheirs<CR>")
  map("n", "<leader>xb", "<cmd>GitConflictChooseBoth<CR>")
end

return M
