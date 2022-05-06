local map = require("utils.map")
local M = {}

M.setup = function()
  -- Override paste with vim-yoink paste
  map("n", "p", "<plug>(YoinkPaste_p)", {})
  map("n", "P", "<plug>(YoinkPaste_P)", {})

  -- Cycling through yanks
  map("n", "<c-n>", "<plug>(YoinkPostPasteSwapBack)", { silent = true })
  map("n", "<c-p>", "<plug>(YoinkPostPasteSwapForward)", { silent = true })

  -- See all yanks
  map("n", "<leader>y", ":Yanks<CR>", { silent = true })

  -- Also replace the default gp with yoink paste so we can toggle paste in this case too
  map("n", "gp", "<plug>(YoinkPaste_gp)", {})
  map("n", "gP", "<plug>(YoinkPaste_gP)", {})
end

return M
