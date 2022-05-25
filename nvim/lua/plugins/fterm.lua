local map = require("utils.map")

local M = {}

M.setup = function()
  -- Floating terminal window
  require("FTerm").setup({
    cmd = "/opt/homebrew/bin/fish",
    border = "rounded",
    dimensions = {
      height = 0.87,
      width = 0.8,
    },
  })

  local opts = { noremap = true, silent = true }
  map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
  map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
end

return M
