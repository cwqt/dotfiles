local map = require("utils.map")

local M = {}

M.setup = function()
  map("n", "<leader>p", "<cmd>lua require('fzf-lua').files()<CR>")
end

return M
