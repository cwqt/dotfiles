local map = require 'utils.map'

local M = {}

M.setup = function()
  -- opening & closing tabs with sayonara
  map('n', '<A-n>', '<cmd>enew<CR>', { silent = true })
  map('n', '<A-w>', '<cmd>Sayonara!<CR>', { silent = true })
  map('n', '<A-q>', '<cmd>Sayonara<CR>', { silent = true })
  map('n', '<A-W>', '<cmd>Resurrect<CR>', { silent = true })

  -- toggle line numbers
  map('n', '<leader>n', ':set number! number?<CR>', { silent = true })
  -- hide hi from search
  map('n', '_', ':nohl<CR>', { silent = true })
  -- view treesitter tokens under cursor
  map('n', '<leader>i', '<cmd>Inspect<CR>', { silent = true })
  -- reset diagnostics
  map('n', '<leader>r', '<cmd>lua vim.diagnostic.reset()<CR>', { silent = true })
  -- reset cursor to always be in the middle of the screen
  map('n', '<leader>cc', ':set scrolloff=999<CR>', { silent = true })
end

return M
