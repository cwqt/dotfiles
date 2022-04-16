local map = require("utils.map")

local M = {}

M.setup = function()
  -- Floating terminal window
  require("FTerm").setup({
    cmd = "/opt/homebrew/bin/fish",
    border = "rounded",
  })

  local opts = { noremap = true, silent = true }
  map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
  map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

  map("n", "<leader>gz", ':lua require("FTerm").run("lazygit")<CR>')
end

return M
