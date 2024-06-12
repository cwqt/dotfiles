local M = {}

M.setup = function()
  -- Show lightbulb for code actions
  vim.cmd([[
    autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
  ]])
end

return M
