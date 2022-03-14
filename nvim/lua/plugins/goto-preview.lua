local map = require("utils.map")

local M = {}

M.setup = function()
  -- peek window
  require("goto-preview").setup({
    width = 80,
  })

  map("n", "gp", ":lua require('goto-preview').goto_preview_definition()<CR>")
  map("n", "gP", ":lua require('goto-preview').close_all_win()<CR>")
end

return M
