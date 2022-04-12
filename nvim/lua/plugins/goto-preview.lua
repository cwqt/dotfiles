local map = require("utils.map")

local M = {}

M.setup = function()
  -- peek window
  require("goto-preview").setup({
    width = 10000,
    border = {"╭", "─" ,"╮", "│", "╯", "─", "╰", "│"}

  })

  map(
    "n",
    "gp",
    ":lua require('goto-preview').goto_preview_definition()<CR>",
    { silent = true }
  )

  map(
    "n",
    "gP",
    ":lua require('goto-preview').close_all_win()<CR>",
    { silent = true }
  )
end

return M
