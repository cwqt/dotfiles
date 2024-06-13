local map = require("utils.map")

local M = {}

M.setup = function()
  map("n", "<leader>p", "<cmd>lua require('fzf-lua').files()<CR>")
  map("n", "<leader>f", "<cmd>lua require('fzf-lua').live_grep()<CR>")
end

return M
