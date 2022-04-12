local map = require("utils.map")

local M = {}

M.setup = function()
  -- comments highlighting -------------------------------------------
  -- HACK:
  -- TODO:
  -- WARN:
  -- PERF:
  -- NOTE:
  -- FIX:
  require("todo-comments").setup({
    signs = false,
  })

  map("n", "<leader>xc", ":TodoTrouble<CR>", { silent = true })
end

return M
