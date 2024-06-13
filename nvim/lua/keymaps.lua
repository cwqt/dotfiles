local map = require 'utils.map'

local M = {}

M.setup = function()
  -- toggle line numbers
  map('n', '<leader>n', ':set number! number?<CR>', { silent = true })

  -- hide hi from search
  map('n', '_', ':nohl<CR>', { silent = true })

  map('n', '<A-n>', '<cmd>enew<CR>', { silent = true })
  map('n', '<A-w>', '<cmd>Sayonara!<CR>', { silent = true })
  map('n', '<A-q>', '<cmd>Sayonara<CR>', { silent = true })
  map('n', '<A-W>', '<cmd>Resurrect<CR>', { silent = true })

  map('n', '<leader>i', '<cmd>Inspect<CR>', { silent = true })

  -- vim.cmd([[
  --   " Open and close a buffer
  --   nnoremap <silent>    <A-n> :enew<CR>
  --   nnoremap <silent>    <A-w> :Sayonara!<CR>
  --   nnoremap <silent>    <A-q> :Sayonara<CR>
  --   " Revive previously closed buffers
  --   nnoremap <silent>    <A-W> :Resurrect<CR>
  -- ]])
end

return M
