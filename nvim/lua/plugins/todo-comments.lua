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
end
return M
