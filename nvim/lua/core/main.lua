local M = {}

M.setup = function()
  -- -- Hide `~` after end of file
  vim.o.fillchars = "eob: "
  vim.opt.list = true
end

return M
