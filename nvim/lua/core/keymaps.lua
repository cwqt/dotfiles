local map = require("utils.map")

local M = {}

M.setup = function()
  vim.cmd(
    "nnoremap <silent> <leader>kk :silent !kitty @ set-spacing padding=0 margin=0<CR>"
  )

  -- toggle line numbers
  map("n", "<leader>n", ":set number! number?<CR>", { silent = true })

  -- " recenter cursor
  map(
    "n",
    "<leader>cc",
    ":set so=999 <CR>:set cursorline<CR>:set number<CR>",
    { silent = true }
  )
  -- hide hi from search
  map("n", "_", ":nohl<CR>", { silent = true })
end

return M
